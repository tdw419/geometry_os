; DESCRIPTION: Composite: Places a purple dot at position (501, 147) then Renders a cyan line between points (208, 62) and (265, 25).
; PLAN: r0=501(x), r1=147(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=208(x1), r6=62(y1), r7=265(x2), r8=25(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 501
LDI r1, 147
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 62
LDI r7, 265
LDI r8, 25
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
