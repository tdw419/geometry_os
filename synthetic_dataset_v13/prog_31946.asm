; DESCRIPTION: Renders a orange line between points (315, 177) and (360, 91).
; PLAN: r0=315(x1), r1=177(y1), r2=360(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 177
LDI r2, 360
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
