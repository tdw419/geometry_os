; DESCRIPTION: Places a red line segment connecting (119, 86) to (473, 164).
; PLAN: r0=119(x1), r1=86(y1), r2=473(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 86
LDI r2, 473
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
