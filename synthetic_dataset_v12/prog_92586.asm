; DESCRIPTION: Renders a blue line between points (470, 135) and (483, 6).
; PLAN: r0=470(x1), r1=135(y1), r2=483(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 135
LDI r2, 483
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
