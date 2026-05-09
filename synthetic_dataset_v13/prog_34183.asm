; DESCRIPTION: Renders a orange line between points (46, 38) and (310, 93).
; PLAN: r0=46(x1), r1=38(y1), r2=310(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 38
LDI r2, 310
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
