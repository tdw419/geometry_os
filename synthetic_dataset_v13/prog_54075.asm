; DESCRIPTION: Composite: Sets a single magenta pixel at (24, 49) then Places a black line segment connecting (120, 151) to (262, 183).
; PLAN: r0=24(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=120(x1), r6=151(y1), r7=262(x2), r8=183(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 151
LDI r7, 262
LDI r8, 183
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
