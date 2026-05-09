; DESCRIPTION: Renders a orange line between points (58, 196) and (252, 40).
; PLAN: r0=58(x1), r1=196(y1), r2=252(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 196
LDI r2, 252
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
