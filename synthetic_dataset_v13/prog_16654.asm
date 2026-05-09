; DESCRIPTION: Renders a orange line between points (416, 128) and (432, 173).
; PLAN: r0=416(x1), r1=128(y1), r2=432(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 128
LDI r2, 432
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
