; DESCRIPTION: Composite: Sets a single magenta pixel at (184, 96) then Renders a magenta line between points (292, 43) and (248, 247).
; PLAN: r0=184(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x1), r6=43(y1), r7=248(x2), r8=247(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 43
LDI r7, 248
LDI r8, 247
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
