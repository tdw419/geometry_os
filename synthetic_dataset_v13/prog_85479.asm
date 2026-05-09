; DESCRIPTION: Places a magenta line segment connecting (397, 217) to (278, 21).
; PLAN: r0=397(x1), r1=217(y1), r2=278(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 217
LDI r2, 278
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
