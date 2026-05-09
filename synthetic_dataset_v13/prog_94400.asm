; DESCRIPTION: Places a blue line segment connecting (508, 81) to (405, 137).
; PLAN: r0=508(x1), r1=81(y1), r2=405(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 81
LDI r2, 405
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
