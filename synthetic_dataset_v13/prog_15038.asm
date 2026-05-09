; DESCRIPTION: Renders a magenta line between points (484, 5) and (345, 98).
; PLAN: r0=484(x1), r1=5(y1), r2=345(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 5
LDI r2, 345
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
