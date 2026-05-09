; DESCRIPTION: Composite: Sets a single blue pixel at (43, 157) then Renders a red line between points (172, 108) and (76, 158).
; PLAN: r0=43(x), r1=157(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=172(x1), r6=108(y1), r7=76(x2), r8=158(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 157
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 172
LDI r6, 108
LDI r7, 76
LDI r8, 158
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
