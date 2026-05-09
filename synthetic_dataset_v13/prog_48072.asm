; DESCRIPTION: Places a magenta line segment connecting (436, 240) to (2, 168).
; PLAN: r0=436(x1), r1=240(y1), r2=2(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 240
LDI r2, 2
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
