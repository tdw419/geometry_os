; DESCRIPTION: Composite: Renders a green line between points (341, 225) and (459, 199) then Draws a orange circle centered at (243, 90) with radius 52 then Sets a single red pixel at (463, 124).
; PLAN: r0=341(x1), r1=225(y1), r2=459(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=90(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x), r11=124(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 225
LDI r2, 459
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 90
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 124
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
