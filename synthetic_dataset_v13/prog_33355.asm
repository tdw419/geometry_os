; DESCRIPTION: Composite: Places a black dot at position (20, 24) then Renders a yellow line between points (26, 250) and (484, 160).
; PLAN: r0=20(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=26(x1), r6=250(y1), r7=484(x2), r8=160(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 26
LDI r6, 250
LDI r7, 484
LDI r8, 160
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
