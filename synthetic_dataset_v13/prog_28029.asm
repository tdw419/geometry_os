; DESCRIPTION: Composite: Places a blue dot at position (4, 88) then Renders a red line between points (139, 13) and (324, 234).
; PLAN: r0=4(x), r1=88(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=13(y1), r7=324(x2), r8=234(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 88
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 13
LDI r7, 324
LDI r8, 234
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
