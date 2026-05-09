; DESCRIPTION: Places a magenta line segment connecting (6, 141) to (176, 128).
; PLAN: r0=6(x1), r1=141(y1), r2=176(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 141
LDI r2, 176
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
