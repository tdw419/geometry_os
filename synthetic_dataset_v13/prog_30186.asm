; DESCRIPTION: Composite: Sets a single green pixel at (168, 81) then Places a black line segment connecting (148, 0) to (98, 77).
; PLAN: r0=168(x), r1=81(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=0(y1), r7=98(x2), r8=77(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 81
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 148
LDI r6, 0
LDI r7, 98
LDI r8, 77
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
