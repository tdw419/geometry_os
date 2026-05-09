; DESCRIPTION: Draws a blue line from (111, 0) to (347, 210).
; PLAN: r0=111(x1), r1=0(y1), r2=347(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 0
LDI r2, 347
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
