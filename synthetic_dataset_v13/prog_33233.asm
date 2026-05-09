; DESCRIPTION: Places a green line segment connecting (419, 91) to (208, 28).
; PLAN: r0=419(x1), r1=91(y1), r2=208(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 91
LDI r2, 208
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
