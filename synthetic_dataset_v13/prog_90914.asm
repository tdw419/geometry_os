; DESCRIPTION: Composite: Sets a single orange pixel at (462, 78) then Places a yellow line segment connecting (401, 194) to (297, 139).
; PLAN: r0=462(x), r1=78(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=194(y1), r7=297(x2), r8=139(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 462
LDI r1, 78
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 401
LDI r6, 194
LDI r7, 297
LDI r8, 139
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
