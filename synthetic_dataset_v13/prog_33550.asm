; DESCRIPTION: Composite: Renders a white line between points (209, 137) and (250, 5) then Renders a red disk with center (145, 118) and radius 80 then Sets a single blue pixel at (26, 95).
; PLAN: r0=209(x1), r1=137(y1), r2=250(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=118(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x), r11=95(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 209
LDI r1, 137
LDI r2, 250
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 118
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 95
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
