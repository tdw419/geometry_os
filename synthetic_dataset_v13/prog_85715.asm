; DESCRIPTION: Places a green line segment connecting (324, 105) to (473, 98).
; PLAN: r0=324(x1), r1=105(y1), r2=473(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 105
LDI r2, 473
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
