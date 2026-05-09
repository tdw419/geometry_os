; DESCRIPTION: Renders a orange line between points (32, 62) and (58, 176).
; PLAN: r0=32(x1), r1=62(y1), r2=58(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 62
LDI r2, 58
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
