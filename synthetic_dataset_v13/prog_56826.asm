; DESCRIPTION: Composite: Draws a white line from (352, 92) to (61, 50) then Sets a single magenta pixel at (20, 7).
; PLAN: r0=352(x1), r1=92(y1), r2=61(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=7(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 92
LDI r2, 61
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 7
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
