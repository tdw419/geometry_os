; DESCRIPTION: Draws a magenta line from (498, 191) to (289, 131).
; PLAN: r0=498(x1), r1=191(y1), r2=289(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 191
LDI r2, 289
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
