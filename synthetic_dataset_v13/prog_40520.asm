; DESCRIPTION: Places a blue line segment connecting (156, 245) to (288, 138).
; PLAN: r0=156(x1), r1=245(y1), r2=288(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 245
LDI r2, 288
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
