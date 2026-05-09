; DESCRIPTION: Renders a orange line between points (46, 13) and (128, 217).
; PLAN: r0=46(x1), r1=13(y1), r2=128(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 13
LDI r2, 128
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
