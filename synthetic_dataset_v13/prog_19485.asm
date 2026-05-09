; DESCRIPTION: Composite: Renders a orange line between points (357, 51) and (495, 79) then Renders a green box of size 32x31 starting at (169, 177) then Creates a red circular shape at (125, 78) with radius 64.
; PLAN: r0=357(x1), r1=51(y1), r2=495(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=177(y), r7=32(width), r8=31(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=125(x), r11=78(y), r12=64(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 357
LDI r1, 51
LDI r2, 495
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 177
LDI r7, 32
LDI r8, 31
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 78
LDI r12, 64
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
