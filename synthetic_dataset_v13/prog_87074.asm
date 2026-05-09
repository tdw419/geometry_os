; DESCRIPTION: Renders a orange line between points (313, 232) and (328, 103).
; PLAN: r0=313(x1), r1=232(y1), r2=328(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 232
LDI r2, 328
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
