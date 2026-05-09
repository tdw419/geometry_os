; DESCRIPTION: Composite: Sets a single green pixel at (431, 45) then Places a green line segment connecting (157, 36) to (204, 216).
; PLAN: r0=431(x), r1=45(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=36(y1), r7=204(x2), r8=216(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 45
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 157
LDI r6, 36
LDI r7, 204
LDI r8, 216
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
