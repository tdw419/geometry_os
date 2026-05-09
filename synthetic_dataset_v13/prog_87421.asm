; DESCRIPTION: Renders a orange line between points (144, 166) and (230, 35).
; PLAN: r0=144(x1), r1=166(y1), r2=230(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 166
LDI r2, 230
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
