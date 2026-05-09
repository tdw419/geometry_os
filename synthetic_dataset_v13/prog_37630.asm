; DESCRIPTION: Composite: Sets a single magenta pixel at (497, 35) then Renders a white line between points (208, 27) and (478, 251) then Renders a red disk with center (208, 37) and radius 31.
; PLAN: r0=497(x), r1=35(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=208(x1), r6=27(y1), r7=478(x2), r8=251(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=208(x), r11=37(y), r12=31(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 497
LDI r1, 35
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 27
LDI r7, 478
LDI r8, 251
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 37
LDI r12, 31
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
