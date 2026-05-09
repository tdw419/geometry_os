; DESCRIPTION: Places a orange line segment connecting (146, 221) to (416, 122).
; PLAN: r0=146(x1), r1=221(y1), r2=416(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 221
LDI r2, 416
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
