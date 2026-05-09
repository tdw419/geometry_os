; DESCRIPTION: Draws a blue line from (77, 186) to (455, 116).
; PLAN: r0=77(x1), r1=186(y1), r2=455(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 186
LDI r2, 455
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
