; DESCRIPTION: Renders a orange line between points (320, 31) and (170, 199).
; PLAN: r0=320(x1), r1=31(y1), r2=170(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 31
LDI r2, 170
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
