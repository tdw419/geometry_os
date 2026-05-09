; DESCRIPTION: Places a magenta line segment connecting (401, 110) to (36, 81).
; PLAN: r0=401(x1), r1=110(y1), r2=36(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 110
LDI r2, 36
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
