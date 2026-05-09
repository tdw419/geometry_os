; DESCRIPTION: Renders a orange line between points (232, 67) and (235, 247).
; PLAN: r0=232(x1), r1=67(y1), r2=235(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 67
LDI r2, 235
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
