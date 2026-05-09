; DESCRIPTION: Composite: Places a black dot at position (116, 77) then Renders a purple line between points (299, 105) and (302, 77).
; PLAN: r0=116(x), r1=77(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=299(x1), r6=105(y1), r7=302(x2), r8=77(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 77
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 105
LDI r7, 302
LDI r8, 77
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
