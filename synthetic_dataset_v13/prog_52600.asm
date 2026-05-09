; DESCRIPTION: Renders a orange line between points (326, 58) and (9, 12).
; PLAN: r0=326(x1), r1=58(y1), r2=9(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 58
LDI r2, 9
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
