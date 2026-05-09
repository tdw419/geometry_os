; DESCRIPTION: Renders a magenta line between points (23, 74) and (490, 160).
; PLAN: r0=23(x1), r1=74(y1), r2=490(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 74
LDI r2, 490
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
