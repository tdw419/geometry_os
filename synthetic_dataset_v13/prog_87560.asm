; DESCRIPTION: Places a green line segment connecting (115, 250) to (249, 23).
; PLAN: r0=115(x1), r1=250(y1), r2=249(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 250
LDI r2, 249
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
