; DESCRIPTION: Composite: Sets a single magenta pixel at (42, 190) then Renders a black line between points (500, 105) and (93, 202).
; PLAN: r0=42(x), r1=190(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=500(x1), r6=105(y1), r7=93(x2), r8=202(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 190
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 500
LDI r6, 105
LDI r7, 93
LDI r8, 202
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
