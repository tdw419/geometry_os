; DESCRIPTION: Renders a blue line between points (44, 150) and (430, 63).
; PLAN: r0=44(x1), r1=150(y1), r2=430(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 150
LDI r2, 430
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
