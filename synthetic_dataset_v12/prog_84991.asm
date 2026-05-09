; DESCRIPTION: Places a magenta line segment connecting (397, 29) to (457, 18).
; PLAN: r0=397(x1), r1=29(y1), r2=457(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 29
LDI r2, 457
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
