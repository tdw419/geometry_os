; DESCRIPTION: Draws a blue line from (47, 45) to (219, 142).
; PLAN: r0=47(x1), r1=45(y1), r2=219(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 45
LDI r2, 219
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
