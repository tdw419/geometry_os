; DESCRIPTION: Draws a blue line from (148, 33) to (110, 142).
; PLAN: r0=148(x1), r1=33(y1), r2=110(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 33
LDI r2, 110
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
