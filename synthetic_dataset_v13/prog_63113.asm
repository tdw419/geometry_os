; DESCRIPTION: Draws a blue line from (117, 137) to (379, 175).
; PLAN: r0=117(x1), r1=137(y1), r2=379(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 137
LDI r2, 379
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
