; DESCRIPTION: Places a green line segment connecting (65, 188) to (475, 99).
; PLAN: r0=65(x1), r1=188(y1), r2=475(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 188
LDI r2, 475
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
