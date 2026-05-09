; DESCRIPTION: Renders a magenta line between points (123, 136) and (110, 48).
; PLAN: r0=123(x1), r1=136(y1), r2=110(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 136
LDI r2, 110
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
