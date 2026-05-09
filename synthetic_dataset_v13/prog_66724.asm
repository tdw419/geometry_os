; DESCRIPTION: Renders a orange line between points (476, 248) and (209, 10).
; PLAN: r0=476(x1), r1=248(y1), r2=209(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 248
LDI r2, 209
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
