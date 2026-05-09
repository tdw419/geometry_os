; DESCRIPTION: Places a green line segment connecting (72, 148) to (44, 72).
; PLAN: r0=72(x1), r1=148(y1), r2=44(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 148
LDI r2, 44
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
