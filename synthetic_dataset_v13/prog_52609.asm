; DESCRIPTION: Places a green line segment connecting (37, 129) to (162, 3).
; PLAN: r0=37(x1), r1=129(y1), r2=162(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 129
LDI r2, 162
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
