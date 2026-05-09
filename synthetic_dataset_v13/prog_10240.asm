; DESCRIPTION: Places a blue line segment connecting (75, 125) to (37, 245).
; PLAN: r0=75(x1), r1=125(y1), r2=37(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 125
LDI r2, 37
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
