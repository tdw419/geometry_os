; DESCRIPTION: Places a green line segment connecting (421, 252) to (230, 33).
; PLAN: r0=421(x1), r1=252(y1), r2=230(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 252
LDI r2, 230
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
