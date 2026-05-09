; DESCRIPTION: Draws a blue line from (280, 131) to (347, 152).
; PLAN: r0=280(x1), r1=131(y1), r2=347(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 131
LDI r2, 347
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
