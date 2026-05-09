; DESCRIPTION: Renders a white line between points (162, 118) and (69, 123).
; PLAN: r0=162(x1), r1=118(y1), r2=69(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 118
LDI r2, 69
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
