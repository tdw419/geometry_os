; DESCRIPTION: Places a red line segment connecting (268, 143) to (471, 122).
; PLAN: r0=268(x1), r1=143(y1), r2=471(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 143
LDI r2, 471
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
