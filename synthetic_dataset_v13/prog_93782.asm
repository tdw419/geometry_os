; DESCRIPTION: Draws a blue line from (143, 191) to (289, 66).
; PLAN: r0=143(x1), r1=191(y1), r2=289(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 191
LDI r2, 289
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
