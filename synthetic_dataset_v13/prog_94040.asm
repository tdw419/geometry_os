; DESCRIPTION: Places a magenta line segment connecting (505, 64) to (131, 193).
; PLAN: r0=505(x1), r1=64(y1), r2=131(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 64
LDI r2, 131
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
