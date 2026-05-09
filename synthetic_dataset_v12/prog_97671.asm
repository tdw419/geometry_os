; DESCRIPTION: Composite: Renders a black disk with center (335, 187) and radius 65 then Renders a magenta line between points (103, 50) and (343, 191) then Sets a single green pixel at (448, 248).
; PLAN: r0=335(x), r1=187(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x1), r6=50(y1), r7=343(x2), r8=191(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=248(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 187
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 50
LDI r7, 343
LDI r8, 191
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 248
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
