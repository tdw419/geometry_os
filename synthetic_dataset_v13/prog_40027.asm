; DESCRIPTION: Draws a blue line from (511, 79) to (177, 121).
; PLAN: r0=511(x1), r1=79(y1), r2=177(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 79
LDI r2, 177
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
