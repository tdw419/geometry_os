; DESCRIPTION: Renders a orange line between points (275, 59) and (81, 89).
; PLAN: r0=275(x1), r1=59(y1), r2=81(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 59
LDI r2, 81
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
