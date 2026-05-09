; DESCRIPTION: Renders a orange line between points (216, 24) and (398, 18).
; PLAN: r0=216(x1), r1=24(y1), r2=398(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 24
LDI r2, 398
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
