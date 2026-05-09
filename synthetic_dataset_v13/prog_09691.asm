; DESCRIPTION: Renders a magenta line between points (85, 250) and (500, 103).
; PLAN: r0=85(x1), r1=250(y1), r2=500(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 250
LDI r2, 500
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
