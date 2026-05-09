; DESCRIPTION: Renders a orange line between points (375, 120) and (269, 11).
; PLAN: r0=375(x1), r1=120(y1), r2=269(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 120
LDI r2, 269
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
