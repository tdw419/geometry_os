; DESCRIPTION: Places a green line segment connecting (435, 245) to (399, 17).
; PLAN: r0=435(x1), r1=245(y1), r2=399(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 245
LDI r2, 399
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
