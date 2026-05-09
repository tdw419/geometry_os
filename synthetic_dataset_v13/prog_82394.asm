; DESCRIPTION: Composite: Renders a blue line between points (463, 232) and (484, 212) then Creates a red circular shape at (185, 47) with radius 42 then Renders a green box of size 111x97 starting at (178, 58).
; PLAN: r0=463(x1), r1=232(y1), r2=484(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=47(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=58(y), r12=111(width), r13=97(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 232
LDI r2, 484
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 47
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 58
LDI r12, 111
LDI r13, 97
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
