; DESCRIPTION: Composite: Renders a yellow line between points (439, 137) and (18, 76) then Renders a yellow disk with center (119, 180) and radius 41 then Sets a single purple pixel at (360, 71).
; PLAN: r0=439(x1), r1=137(y1), r2=18(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=180(y), r7=41(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x), r11=71(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 137
LDI r2, 18
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 180
LDI r7, 41
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 71
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
