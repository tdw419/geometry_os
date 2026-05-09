; DESCRIPTION: Draws a blue line from (177, 71) to (476, 31).
; PLAN: r0=177(x1), r1=71(y1), r2=476(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 71
LDI r2, 476
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
