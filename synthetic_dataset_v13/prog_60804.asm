; DESCRIPTION: Composite: Renders a magenta line between points (90, 89) and (457, 201) then Creates a magenta circular shape at (161, 78) with radius 55 then Sets a single cyan pixel at (264, 146).
; PLAN: r0=90(x1), r1=89(y1), r2=457(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=78(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=146(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 89
LDI r2, 457
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 78
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 146
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
