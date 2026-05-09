; DESCRIPTION: Renders a white line between points (170, 18) and (40, 31).
; PLAN: r0=170(x1), r1=18(y1), r2=40(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 18
LDI r2, 40
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
