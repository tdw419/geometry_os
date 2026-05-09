; DESCRIPTION: Places a magenta line segment connecting (384, 63) to (476, 244).
; PLAN: r0=384(x1), r1=63(y1), r2=476(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 63
LDI r2, 476
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
