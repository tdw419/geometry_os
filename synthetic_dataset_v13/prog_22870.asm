; DESCRIPTION: Places a green line segment connecting (405, 84) to (507, 149).
; PLAN: r0=405(x1), r1=84(y1), r2=507(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 84
LDI r2, 507
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
