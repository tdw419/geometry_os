; DESCRIPTION: Renders a magenta line between points (360, 63) and (56, 110).
; PLAN: r0=360(x1), r1=63(y1), r2=56(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 63
LDI r2, 56
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
