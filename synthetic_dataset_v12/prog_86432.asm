; DESCRIPTION: Renders a orange line between points (423, 207) and (93, 113).
; PLAN: r0=423(x1), r1=207(y1), r2=93(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 207
LDI r2, 93
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
