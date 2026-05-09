; DESCRIPTION: Draws a blue line from (336, 194) to (16, 51).
; PLAN: r0=336(x1), r1=194(y1), r2=16(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 194
LDI r2, 16
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
