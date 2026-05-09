; DESCRIPTION: Places a magenta line segment connecting (14, 208) to (268, 237).
; PLAN: r0=14(x1), r1=208(y1), r2=268(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 208
LDI r2, 268
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
