; DESCRIPTION: Places a magenta line segment connecting (12, 186) to (325, 49).
; PLAN: r0=12(x1), r1=186(y1), r2=325(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 186
LDI r2, 325
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
