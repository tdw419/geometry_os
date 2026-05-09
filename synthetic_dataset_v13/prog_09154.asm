; DESCRIPTION: Renders a white line between points (501, 80) and (9, 137).
; PLAN: r0=501(x1), r1=80(y1), r2=9(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 80
LDI r2, 9
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
