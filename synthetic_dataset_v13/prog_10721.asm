; DESCRIPTION: Renders a blue line between points (57, 201) and (421, 40).
; PLAN: r0=57(x1), r1=201(y1), r2=421(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 201
LDI r2, 421
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
