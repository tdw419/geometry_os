; DESCRIPTION: Renders a orange line between points (345, 63) and (192, 133).
; PLAN: r0=345(x1), r1=63(y1), r2=192(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 63
LDI r2, 192
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
