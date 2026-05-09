; DESCRIPTION: Places a red line segment connecting (296, 192) to (48, 218).
; PLAN: r0=296(x1), r1=192(y1), r2=48(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 192
LDI r2, 48
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
