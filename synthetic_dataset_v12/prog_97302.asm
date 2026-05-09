; DESCRIPTION: Places a black line segment connecting (106, 125) to (88, 24).
; PLAN: r0=106(x1), r1=125(y1), r2=88(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 125
LDI r2, 88
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
