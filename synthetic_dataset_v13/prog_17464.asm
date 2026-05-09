; DESCRIPTION: Composite: Creates a red circular shape at (66, 156) with radius 28 then Renders a cyan line between points (389, 249) and (141, 122) then Draws a magenta rectangle at (13, 151) with width 33 and height 86.
; PLAN: r0=66(x), r1=156(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x1), r6=249(y1), r7=141(x2), r8=122(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=13(x), r11=151(y), r12=33(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 156
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 249
LDI r7, 141
LDI r8, 122
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 151
LDI r12, 33
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
