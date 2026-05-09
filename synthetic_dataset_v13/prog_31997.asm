; DESCRIPTION: Renders a orange line between points (185, 172) and (475, 138).
; PLAN: r0=185(x1), r1=172(y1), r2=475(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 172
LDI r2, 475
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
