; DESCRIPTION: Places a red line segment connecting (6, 113) to (359, 176).
; PLAN: r0=6(x1), r1=113(y1), r2=359(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 113
LDI r2, 359
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
