; DESCRIPTION: Composite: Draws a magenta rectangle at (101, 126) with width 107 and height 61 then Draws a red circle centered at (331, 53) with radius 30 then Renders a green line between points (161, 203) and (348, 214).
; PLAN: r0=101(x), r1=126(y), r2=107(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=53(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x1), r11=203(y1), r12=348(x2), r13=214(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 126
LDI r2, 107
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 53
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 203
LDI r12, 348
LDI r13, 214
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
