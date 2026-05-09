; DESCRIPTION: Renders a orange line between points (461, 255) and (92, 138).
; PLAN: r0=461(x1), r1=255(y1), r2=92(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 255
LDI r2, 92
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
