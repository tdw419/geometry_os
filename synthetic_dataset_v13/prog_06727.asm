; DESCRIPTION: Places a green line segment connecting (419, 78) to (130, 107).
; PLAN: r0=419(x1), r1=78(y1), r2=130(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 78
LDI r2, 130
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
