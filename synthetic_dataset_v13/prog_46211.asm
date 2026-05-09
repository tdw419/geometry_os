; DESCRIPTION: Places a magenta line segment connecting (244, 28) to (436, 40).
; PLAN: r0=244(x1), r1=28(y1), r2=436(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 28
LDI r2, 436
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
