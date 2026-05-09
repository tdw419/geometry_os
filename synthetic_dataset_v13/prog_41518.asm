; DESCRIPTION: Composite: Renders a orange line between points (448, 215) and (433, 75) then Creates a red circular shape at (293, 87) with radius 22 then Sets a single red pixel at (439, 108).
; PLAN: r0=448(x1), r1=215(y1), r2=433(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=87(y), r7=22(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=108(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 448
LDI r1, 215
LDI r2, 433
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 87
LDI r7, 22
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 108
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
