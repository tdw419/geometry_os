; DESCRIPTION: Places a orange line segment connecting (401, 217) to (36, 179).
; PLAN: r0=401(x1), r1=217(y1), r2=36(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 217
LDI r2, 36
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
