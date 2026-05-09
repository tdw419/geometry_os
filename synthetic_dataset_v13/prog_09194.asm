; DESCRIPTION: Renders a orange line between points (173, 233) and (492, 109).
; PLAN: r0=173(x1), r1=233(y1), r2=492(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 233
LDI r2, 492
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
