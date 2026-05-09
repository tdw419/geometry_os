; DESCRIPTION: Places a red line segment connecting (38, 49) to (203, 159).
; PLAN: r0=38(x1), r1=49(y1), r2=203(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 49
LDI r2, 203
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
