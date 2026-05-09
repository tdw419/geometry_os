; DESCRIPTION: Composite: Places a cyan dot at position (62, 26) then Renders a red line between points (378, 22) and (57, 184).
; PLAN: r0=62(x), r1=26(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=378(x1), r6=22(y1), r7=57(x2), r8=184(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 26
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 378
LDI r6, 22
LDI r7, 57
LDI r8, 184
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
