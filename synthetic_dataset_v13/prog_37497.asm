; DESCRIPTION: Draws a blue line from (139, 191) to (236, 149).
; PLAN: r0=139(x1), r1=191(y1), r2=236(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 191
LDI r2, 236
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
