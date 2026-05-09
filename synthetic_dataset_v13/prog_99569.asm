; DESCRIPTION: Places a blue line segment connecting (110, 46) to (51, 246).
; PLAN: r0=110(x1), r1=46(y1), r2=51(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 46
LDI r2, 51
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
