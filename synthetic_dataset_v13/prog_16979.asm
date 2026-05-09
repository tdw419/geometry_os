; DESCRIPTION: Places a magenta line segment connecting (421, 37) to (436, 2).
; PLAN: r0=421(x1), r1=37(y1), r2=436(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 37
LDI r2, 436
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
