; DESCRIPTION: Places a magenta line segment connecting (411, 219) to (263, 244).
; PLAN: r0=411(x1), r1=219(y1), r2=263(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 219
LDI r2, 263
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
