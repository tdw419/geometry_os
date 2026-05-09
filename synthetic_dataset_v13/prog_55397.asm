; DESCRIPTION: Renders a purple line between points (6, 2) and (127, 168).
; PLAN: r0=6(x1), r1=2(y1), r2=127(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 2
LDI r2, 127
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
