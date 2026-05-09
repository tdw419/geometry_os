; DESCRIPTION: Composite: Sets a single red pixel at (225, 111) then Renders a cyan line between points (107, 9) and (194, 73).
; PLAN: r0=225(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=9(y1), r7=194(x2), r8=73(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 111
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 107
LDI r6, 9
LDI r7, 194
LDI r8, 73
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
