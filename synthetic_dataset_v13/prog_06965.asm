; DESCRIPTION: Composite: Draws a white line from (477, 168) to (134, 228) then Sets a single magenta pixel at (129, 183).
; PLAN: r0=477(x1), r1=168(y1), r2=134(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 477
LDI r1, 168
LDI r2, 134
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
