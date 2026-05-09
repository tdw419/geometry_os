; DESCRIPTION: Places a magenta line segment connecting (205, 249) to (420, 106).
; PLAN: r0=205(x1), r1=249(y1), r2=420(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 249
LDI r2, 420
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
