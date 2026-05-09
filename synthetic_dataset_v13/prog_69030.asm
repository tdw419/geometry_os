; DESCRIPTION: Renders a orange line between points (20, 207) and (246, 18).
; PLAN: r0=20(x1), r1=207(y1), r2=246(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 207
LDI r2, 246
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
