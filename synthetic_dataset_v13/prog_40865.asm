; DESCRIPTION: Places a magenta line segment connecting (167, 104) to (94, 137).
; PLAN: r0=167(x1), r1=104(y1), r2=94(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 104
LDI r2, 94
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
