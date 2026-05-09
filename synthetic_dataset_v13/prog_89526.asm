; DESCRIPTION: Renders a orange line between points (298, 43) and (102, 148).
; PLAN: r0=298(x1), r1=43(y1), r2=102(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 43
LDI r2, 102
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
