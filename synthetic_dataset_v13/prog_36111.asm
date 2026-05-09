; DESCRIPTION: Renders a white line between points (314, 117) and (313, 112).
; PLAN: r0=314(x1), r1=117(y1), r2=313(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 117
LDI r2, 313
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
