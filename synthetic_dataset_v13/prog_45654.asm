; DESCRIPTION: Draws a blue line from (286, 56) to (289, 226).
; PLAN: r0=286(x1), r1=56(y1), r2=289(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 56
LDI r2, 289
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
