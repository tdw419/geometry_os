; DESCRIPTION: Composite: Sets a single black pixel at (109, 83) then Renders a white line between points (61, 30) and (476, 89).
; PLAN: r0=109(x), r1=83(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=61(x1), r6=30(y1), r7=476(x2), r8=89(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 83
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 61
LDI r6, 30
LDI r7, 476
LDI r8, 89
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
