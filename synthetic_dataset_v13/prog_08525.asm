; DESCRIPTION: Renders a white line between points (287, 99) and (34, 22).
; PLAN: r0=287(x1), r1=99(y1), r2=34(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 99
LDI r2, 34
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
