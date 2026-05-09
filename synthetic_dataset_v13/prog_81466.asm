; DESCRIPTION: Draws a blue line from (289, 5) to (361, 26).
; PLAN: r0=289(x1), r1=5(y1), r2=361(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 5
LDI r2, 361
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
