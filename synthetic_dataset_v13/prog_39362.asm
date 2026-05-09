; DESCRIPTION: Draws a blue line from (347, 44) to (387, 43).
; PLAN: r0=347(x1), r1=44(y1), r2=387(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 44
LDI r2, 387
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
