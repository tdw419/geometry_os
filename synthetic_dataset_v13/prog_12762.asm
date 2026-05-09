; DESCRIPTION: Composite: Places a white dot at position (292, 108) then Renders a green line between points (423, 31) and (467, 105).
; PLAN: r0=292(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=423(x1), r6=31(y1), r7=467(x2), r8=105(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 423
LDI r6, 31
LDI r7, 467
LDI r8, 105
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
