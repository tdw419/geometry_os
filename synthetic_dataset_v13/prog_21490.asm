; DESCRIPTION: Draws a blue line from (373, 33) to (10, 2).
; PLAN: r0=373(x1), r1=33(y1), r2=10(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 33
LDI r2, 10
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
