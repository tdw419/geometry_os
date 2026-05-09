; DESCRIPTION: Renders a orange line between points (435, 50) and (77, 128).
; PLAN: r0=435(x1), r1=50(y1), r2=77(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 50
LDI r2, 77
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
