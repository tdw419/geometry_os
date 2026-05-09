; DESCRIPTION: Renders a magenta line between points (101, 80) and (200, 16).
; PLAN: r0=101(x1), r1=80(y1), r2=200(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 80
LDI r2, 200
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
