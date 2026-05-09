; DESCRIPTION: Renders a green line between points (64, 170) and (223, 162).
; PLAN: r0=64(x1), r1=170(y1), r2=223(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 170
LDI r2, 223
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
