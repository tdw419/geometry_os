; DESCRIPTION: Places a red line segment connecting (416, 187) to (459, 176).
; PLAN: r0=416(x1), r1=187(y1), r2=459(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 187
LDI r2, 459
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
