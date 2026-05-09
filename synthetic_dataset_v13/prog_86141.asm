; DESCRIPTION: Places a green line segment connecting (443, 49) to (84, 58).
; PLAN: r0=443(x1), r1=49(y1), r2=84(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 49
LDI r2, 84
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
