; DESCRIPTION: Places a green line segment connecting (102, 209) to (201, 175).
; PLAN: r0=102(x1), r1=209(y1), r2=201(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 209
LDI r2, 201
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
