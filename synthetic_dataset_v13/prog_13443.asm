; DESCRIPTION: Renders a magenta line between points (490, 149) and (350, 160).
; PLAN: r0=490(x1), r1=149(y1), r2=350(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 149
LDI r2, 350
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
