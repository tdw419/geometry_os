; DESCRIPTION: Composite: Sets a single cyan pixel at (119, 106) then Renders a magenta line between points (446, 99) and (338, 232).
; PLAN: r0=119(x), r1=106(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=446(x1), r6=99(y1), r7=338(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 106
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 446
LDI r6, 99
LDI r7, 338
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
