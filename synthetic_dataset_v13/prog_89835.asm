; DESCRIPTION: Renders a blue line between points (483, 7) and (91, 87).
; PLAN: r0=483(x1), r1=7(y1), r2=91(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 7
LDI r2, 91
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
