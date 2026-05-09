; DESCRIPTION: Composite: Renders a orange line between points (375, 140) and (107, 104) then Sets a single cyan pixel at (464, 120).
; PLAN: r0=375(x1), r1=140(y1), r2=107(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=120(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 140
LDI r2, 107
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 120
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
