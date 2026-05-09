; DESCRIPTION: Composite: Sets a single orange pixel at (351, 140) then Renders a blue line between points (482, 185) and (292, 184).
; PLAN: r0=351(x), r1=140(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=482(x1), r6=185(y1), r7=292(x2), r8=184(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 140
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 482
LDI r6, 185
LDI r7, 292
LDI r8, 184
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
