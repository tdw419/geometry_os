; DESCRIPTION: Composite: Places a purple line segment connecting (111, 90) to (361, 134) then Places a white dot at position (185, 166).
; PLAN: r0=111(x1), r1=90(y1), r2=361(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=166(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 90
LDI r2, 361
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 166
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
