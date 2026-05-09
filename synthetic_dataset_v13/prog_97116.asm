; DESCRIPTION: Renders a magenta line between points (213, 106) and (22, 150).
; PLAN: r0=213(x1), r1=106(y1), r2=22(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 106
LDI r2, 22
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
