; DESCRIPTION: Composite: Creates a cyan rectangular region at (145, 55) spanning 91 by 95 pixels then Renders a magenta line between points (227, 45) and (125, 65) then Sets a single orange pixel at (77, 22).
; PLAN: r0=145(x), r1=55(y), r2=91(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x1), r6=45(y1), r7=125(x2), r8=65(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=22(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 55
LDI r2, 91
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 45
LDI r7, 125
LDI r8, 65
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 22
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
