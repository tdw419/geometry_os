; DESCRIPTION: Places a magenta line segment connecting (373, 95) to (409, 19).
; PLAN: r0=373(x1), r1=95(y1), r2=409(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 95
LDI r2, 409
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
