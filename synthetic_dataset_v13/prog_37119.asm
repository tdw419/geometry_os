; DESCRIPTION: Places a white line segment connecting (435, 199) to (41, 144).
; PLAN: r0=435(x1), r1=199(y1), r2=41(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 199
LDI r2, 41
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
