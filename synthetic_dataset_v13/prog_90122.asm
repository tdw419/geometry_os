; DESCRIPTION: Draws a blue line from (177, 126) to (289, 157).
; PLAN: r0=177(x1), r1=126(y1), r2=289(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 126
LDI r2, 289
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
