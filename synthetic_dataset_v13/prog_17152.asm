; DESCRIPTION: Composite: Places a blue dot at position (6, 6) then Renders a cyan line between points (192, 3) and (385, 194).
; PLAN: r0=6(x), r1=6(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=3(y1), r7=385(x2), r8=194(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 6
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 3
LDI r7, 385
LDI r8, 194
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
