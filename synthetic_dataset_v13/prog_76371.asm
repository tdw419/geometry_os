; DESCRIPTION: Places a blue line segment connecting (473, 66) to (443, 52).
; PLAN: r0=473(x1), r1=66(y1), r2=443(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 66
LDI r2, 443
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
