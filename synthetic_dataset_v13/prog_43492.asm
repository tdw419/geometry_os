; DESCRIPTION: Draws a blue line from (107, 28) to (289, 98).
; PLAN: r0=107(x1), r1=28(y1), r2=289(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 28
LDI r2, 289
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
