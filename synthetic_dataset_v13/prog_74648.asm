; DESCRIPTION: Renders a green line between points (49, 110) and (28, 12).
; PLAN: r0=49(x1), r1=110(y1), r2=28(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 110
LDI r2, 28
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
