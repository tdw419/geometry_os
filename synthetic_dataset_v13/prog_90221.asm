; DESCRIPTION: Places a magenta line segment connecting (95, 17) to (130, 180).
; PLAN: r0=95(x1), r1=17(y1), r2=130(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 17
LDI r2, 130
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
