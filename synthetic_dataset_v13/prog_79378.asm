; DESCRIPTION: Places a green line segment connecting (163, 220) to (317, 175).
; PLAN: r0=163(x1), r1=220(y1), r2=317(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 220
LDI r2, 317
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
