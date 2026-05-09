; DESCRIPTION: Renders a orange line between points (275, 26) and (29, 175).
; PLAN: r0=275(x1), r1=26(y1), r2=29(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 26
LDI r2, 29
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
