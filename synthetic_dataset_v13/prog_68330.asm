; DESCRIPTION: Renders a orange line between points (457, 173) and (341, 102).
; PLAN: r0=457(x1), r1=173(y1), r2=341(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 173
LDI r2, 341
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
