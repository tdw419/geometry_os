; DESCRIPTION: Renders a white line between points (88, 91) and (310, 80).
; PLAN: r0=88(x1), r1=91(y1), r2=310(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 91
LDI r2, 310
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
