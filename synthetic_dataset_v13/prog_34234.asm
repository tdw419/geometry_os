; DESCRIPTION: Places a magenta line segment connecting (205, 205) to (57, 212).
; PLAN: r0=205(x1), r1=205(y1), r2=57(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 205
LDI r2, 57
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
