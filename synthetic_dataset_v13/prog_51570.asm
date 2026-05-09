; DESCRIPTION: Draws a blue line from (27, 133) to (455, 137).
; PLAN: r0=27(x1), r1=133(y1), r2=455(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 133
LDI r2, 455
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
