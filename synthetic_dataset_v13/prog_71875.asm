; DESCRIPTION: Renders a orange line between points (54, 223) and (476, 231).
; PLAN: r0=54(x1), r1=223(y1), r2=476(x2), r3=231(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 223
LDI r2, 476
LDI r3, 231
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
