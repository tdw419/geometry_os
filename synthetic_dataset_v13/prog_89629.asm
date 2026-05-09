; DESCRIPTION: Places a magenta line segment connecting (338, 104) to (138, 138).
; PLAN: r0=338(x1), r1=104(y1), r2=138(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 104
LDI r2, 138
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
