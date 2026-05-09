; DESCRIPTION: Renders a orange line between points (320, 81) and (118, 4).
; PLAN: r0=320(x1), r1=81(y1), r2=118(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 81
LDI r2, 118
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
