; DESCRIPTION: Places a magenta line segment connecting (180, 21) to (397, 97).
; PLAN: r0=180(x1), r1=21(y1), r2=397(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 21
LDI r2, 397
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
