; DESCRIPTION: Composite: Sets a single magenta pixel at (110, 156) then Renders a cyan line between points (378, 163) and (371, 101).
; PLAN: r0=110(x), r1=156(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=378(x1), r6=163(y1), r7=371(x2), r8=101(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 156
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 163
LDI r7, 371
LDI r8, 101
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
