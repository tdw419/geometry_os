; DESCRIPTION: Places a green line segment connecting (166, 204) to (84, 99).
; PLAN: r0=166(x1), r1=204(y1), r2=84(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 204
LDI r2, 84
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
