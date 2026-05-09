; DESCRIPTION: Composite: Sets a single magenta pixel at (492, 131) then Draws a magenta line from (356, 96) to (18, 6).
; PLAN: r0=492(x), r1=131(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=356(x1), r6=96(y1), r7=18(x2), r8=6(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 131
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 96
LDI r7, 18
LDI r8, 6
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
