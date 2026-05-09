; DESCRIPTION: Renders a magenta line between points (280, 15) and (200, 141).
; PLAN: r0=280(x1), r1=15(y1), r2=200(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 15
LDI r2, 200
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
