; DESCRIPTION: Renders a magenta line between points (132, 196) and (106, 23).
; PLAN: r0=132(x1), r1=196(y1), r2=106(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 196
LDI r2, 106
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
