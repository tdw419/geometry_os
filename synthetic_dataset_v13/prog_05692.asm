; DESCRIPTION: Places a magenta line segment connecting (172, 142) to (92, 130).
; PLAN: r0=172(x1), r1=142(y1), r2=92(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 142
LDI r2, 92
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
