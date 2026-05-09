; DESCRIPTION: Renders a blue line between points (52, 61) and (178, 140).
; PLAN: r0=52(x1), r1=61(y1), r2=178(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 61
LDI r2, 178
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
