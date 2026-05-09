; DESCRIPTION: Renders a magenta line between points (201, 76) and (492, 196).
; PLAN: r0=201(x1), r1=76(y1), r2=492(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 76
LDI r2, 492
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
