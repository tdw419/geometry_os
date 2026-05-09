; DESCRIPTION: Draws a blue line from (347, 254) to (1, 63).
; PLAN: r0=347(x1), r1=254(y1), r2=1(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 254
LDI r2, 1
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
