; DESCRIPTION: Renders a orange line between points (368, 78) and (410, 90).
; PLAN: r0=368(x1), r1=78(y1), r2=410(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 78
LDI r2, 410
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
