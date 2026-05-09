; DESCRIPTION: Places a magenta line segment connecting (128, 63) to (420, 178).
; PLAN: r0=128(x1), r1=63(y1), r2=420(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 63
LDI r2, 420
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
