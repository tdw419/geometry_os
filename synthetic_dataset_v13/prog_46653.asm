; DESCRIPTION: Renders a yellow line between points (311, 72) and (275, 122).
; PLAN: r0=311(x1), r1=72(y1), r2=275(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 72
LDI r2, 275
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
