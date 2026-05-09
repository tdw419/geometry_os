; DESCRIPTION: Draws a blue line from (335, 153) to (444, 138).
; PLAN: r0=335(x1), r1=153(y1), r2=444(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 153
LDI r2, 444
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
