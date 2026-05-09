; DESCRIPTION: Draws a blue line from (250, 56) to (341, 48).
; PLAN: r0=250(x1), r1=56(y1), r2=341(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 56
LDI r2, 341
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
