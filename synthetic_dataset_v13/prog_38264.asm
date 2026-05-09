; DESCRIPTION: Places a magenta line segment connecting (7, 17) to (424, 161).
; PLAN: r0=7(x1), r1=17(y1), r2=424(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 17
LDI r2, 424
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
