; DESCRIPTION: Draws a blue line from (409, 45) to (51, 50).
; PLAN: r0=409(x1), r1=45(y1), r2=51(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 45
LDI r2, 51
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
