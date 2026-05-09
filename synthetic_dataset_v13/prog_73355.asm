; DESCRIPTION: Draws a blue line from (23, 112) to (376, 70).
; PLAN: r0=23(x1), r1=112(y1), r2=376(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 112
LDI r2, 376
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
