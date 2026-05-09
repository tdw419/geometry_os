; DESCRIPTION: Composite: Sets a single orange pixel at (329, 120) then Places a white line segment connecting (62, 251) to (230, 34).
; PLAN: r0=329(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=251(y1), r7=230(x2), r8=34(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 329
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 62
LDI r6, 251
LDI r7, 230
LDI r8, 34
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
