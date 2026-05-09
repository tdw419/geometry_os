; DESCRIPTION: Places a magenta line segment connecting (253, 205) to (54, 18).
; PLAN: r0=253(x1), r1=205(y1), r2=54(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 205
LDI r2, 54
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
