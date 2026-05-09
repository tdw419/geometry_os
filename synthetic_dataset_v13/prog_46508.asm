; DESCRIPTION: Renders a orange line between points (507, 223) and (494, 211).
; PLAN: r0=507(x1), r1=223(y1), r2=494(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 223
LDI r2, 494
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
