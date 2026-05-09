; DESCRIPTION: Draws a blue line from (192, 33) to (160, 51).
; PLAN: r0=192(x1), r1=33(y1), r2=160(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 33
LDI r2, 160
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
