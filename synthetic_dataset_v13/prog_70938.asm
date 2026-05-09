; DESCRIPTION: Composite: Sets a single red pixel at (433, 192) then Renders a red line between points (383, 31) and (249, 196).
; PLAN: r0=433(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=383(x1), r6=31(y1), r7=249(x2), r8=196(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 383
LDI r6, 31
LDI r7, 249
LDI r8, 196
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
