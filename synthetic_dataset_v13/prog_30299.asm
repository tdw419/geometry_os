; DESCRIPTION: Places a red line segment connecting (119, 67) to (192, 248).
; PLAN: r0=119(x1), r1=67(y1), r2=192(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 67
LDI r2, 192
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
