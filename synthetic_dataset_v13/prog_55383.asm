; DESCRIPTION: Places a magenta line segment connecting (463, 37) to (422, 233).
; PLAN: r0=463(x1), r1=37(y1), r2=422(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 37
LDI r2, 422
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
