; DESCRIPTION: Places a magenta line segment connecting (54, 45) to (260, 49).
; PLAN: r0=54(x1), r1=45(y1), r2=260(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 45
LDI r2, 260
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
