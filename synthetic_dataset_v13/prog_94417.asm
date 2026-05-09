; DESCRIPTION: Composite: Renders a magenta line between points (344, 205) and (343, 38) then Renders a black disk with center (249, 120) and radius 70 then Creates a green rectangular region at (125, 53) spanning 84 by 36 pixels.
; PLAN: r0=344(x1), r1=205(y1), r2=343(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=120(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x), r11=53(y), r12=84(width), r13=36(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 205
LDI r2, 343
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 120
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 53
LDI r12, 84
LDI r13, 36
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
