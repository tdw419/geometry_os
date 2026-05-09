; DESCRIPTION: Composite: Places a yellow dot at position (349, 102) then Places a white line segment connecting (232, 157) to (321, 169).
; PLAN: r0=349(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=157(y1), r7=321(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 102
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 232
LDI r6, 157
LDI r7, 321
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
