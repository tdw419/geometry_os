; DESCRIPTION: Composite: Creates a red circular shape at (292, 192) with radius 58 then Draws a green rectangle at (262, 16) with width 81 and height 24 then Places a white line segment connecting (232, 50) to (133, 222).
; PLAN: r0=292(x), r1=192(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=16(y), r7=81(width), r8=24(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=232(x1), r11=50(y1), r12=133(x2), r13=222(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 192
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 16
LDI r7, 81
LDI r8, 24
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 50
LDI r12, 133
LDI r13, 222
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
