; DESCRIPTION: Composite: Sets a single cyan pixel at (511, 1) then Renders a blue line between points (195, 101) and (90, 66).
; PLAN: r0=511(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=195(x1), r6=101(y1), r7=90(x2), r8=66(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 195
LDI r6, 101
LDI r7, 90
LDI r8, 66
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
