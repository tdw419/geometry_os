; DESCRIPTION: Composite: Places a yellow dot at position (478, 250) then Draws a blue line from (115, 137) to (282, 154).
; PLAN: r0=478(x), r1=250(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=137(y1), r7=282(x2), r8=154(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 478
LDI r1, 250
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 115
LDI r6, 137
LDI r7, 282
LDI r8, 154
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
