; DESCRIPTION: Renders a yellow line between points (14, 34) and (370, 9).
; PLAN: r0=14(x1), r1=34(y1), r2=370(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 34
LDI r2, 370
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
