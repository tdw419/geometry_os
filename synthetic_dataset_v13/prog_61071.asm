; DESCRIPTION: Places a red line segment connecting (263, 192) to (155, 94).
; PLAN: r0=263(x1), r1=192(y1), r2=155(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 192
LDI r2, 155
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
