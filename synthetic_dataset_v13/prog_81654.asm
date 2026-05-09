; DESCRIPTION: Renders a orange line between points (209, 196) and (477, 184).
; PLAN: r0=209(x1), r1=196(y1), r2=477(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 196
LDI r2, 477
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
