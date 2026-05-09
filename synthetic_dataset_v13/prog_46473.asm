; DESCRIPTION: Renders a orange line between points (252, 167) and (416, 198).
; PLAN: r0=252(x1), r1=167(y1), r2=416(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 167
LDI r2, 416
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
