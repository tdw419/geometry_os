; DESCRIPTION: Renders a orange line between points (474, 252) and (16, 178).
; PLAN: r0=474(x1), r1=252(y1), r2=16(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 252
LDI r2, 16
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
