; DESCRIPTION: Places a magenta line segment connecting (501, 159) to (465, 128).
; PLAN: r0=501(x1), r1=159(y1), r2=465(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 159
LDI r2, 465
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
