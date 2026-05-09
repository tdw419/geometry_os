; DESCRIPTION: Places a blue line segment connecting (354, 174) to (100, 109).
; PLAN: r0=354(x1), r1=174(y1), r2=100(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 174
LDI r2, 100
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
