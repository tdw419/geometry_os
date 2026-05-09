; DESCRIPTION: Draws a blue line from (343, 48) to (279, 116).
; PLAN: r0=343(x1), r1=48(y1), r2=279(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 48
LDI r2, 279
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
