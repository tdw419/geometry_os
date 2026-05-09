; DESCRIPTION: Places a blue line segment connecting (71, 163) to (338, 91).
; PLAN: r0=71(x1), r1=163(y1), r2=338(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 163
LDI r2, 338
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
