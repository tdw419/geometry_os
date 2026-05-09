; DESCRIPTION: Renders a orange line between points (115, 33) and (320, 118).
; PLAN: r0=115(x1), r1=33(y1), r2=320(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 33
LDI r2, 320
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
