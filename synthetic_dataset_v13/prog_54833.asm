; DESCRIPTION: Composite: Places a yellow dot at position (292, 176) then Renders a green line between points (185, 166) and (335, 11).
; PLAN: r0=292(x), r1=176(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=185(x1), r6=166(y1), r7=335(x2), r8=11(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 176
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 185
LDI r6, 166
LDI r7, 335
LDI r8, 11
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
