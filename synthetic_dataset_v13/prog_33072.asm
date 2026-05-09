; DESCRIPTION: Renders a magenta line between points (450, 91) and (68, 185).
; PLAN: r0=450(x1), r1=91(y1), r2=68(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 91
LDI r2, 68
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
