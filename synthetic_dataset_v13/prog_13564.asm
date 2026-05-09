; DESCRIPTION: Composite: Places a cyan dot at position (90, 176) then Renders a purple line between points (208, 92) and (501, 21).
; PLAN: r0=90(x), r1=176(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=208(x1), r6=92(y1), r7=501(x2), r8=21(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 176
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 92
LDI r7, 501
LDI r8, 21
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
