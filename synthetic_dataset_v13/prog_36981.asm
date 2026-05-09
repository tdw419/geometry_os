; DESCRIPTION: Composite: Sets a single green pixel at (352, 114) then Places a white line segment connecting (89, 93) to (249, 89).
; PLAN: r0=352(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=89(x1), r6=93(y1), r7=249(x2), r8=89(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 89
LDI r6, 93
LDI r7, 249
LDI r8, 89
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
