; DESCRIPTION: Renders a orange line between points (178, 16) and (486, 191).
; PLAN: r0=178(x1), r1=16(y1), r2=486(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 16
LDI r2, 486
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
