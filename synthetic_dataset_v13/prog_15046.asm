; DESCRIPTION: Composite: Places a white dot at position (382, 124) then Places a blue line segment connecting (41, 250) to (498, 126).
; PLAN: r0=382(x), r1=124(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=41(x1), r6=250(y1), r7=498(x2), r8=126(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 124
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 250
LDI r7, 498
LDI r8, 126
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
