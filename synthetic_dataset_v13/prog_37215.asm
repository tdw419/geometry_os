; DESCRIPTION: Composite: Places a red dot at position (102, 73) then Places a red line segment connecting (385, 204) to (508, 139).
; PLAN: r0=102(x), r1=73(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=385(x1), r6=204(y1), r7=508(x2), r8=139(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 73
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 385
LDI r6, 204
LDI r7, 508
LDI r8, 139
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
