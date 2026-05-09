; DESCRIPTION: Composite: Sets a single cyan pixel at (497, 84) then Renders a white line between points (432, 136) and (5, 131).
; PLAN: r0=497(x), r1=84(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=432(x1), r6=136(y1), r7=5(x2), r8=131(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 497
LDI r1, 84
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 432
LDI r6, 136
LDI r7, 5
LDI r8, 131
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
