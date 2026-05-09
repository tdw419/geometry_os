; DESCRIPTION: Places a red line segment connecting (67, 84) to (351, 46).
; PLAN: r0=67(x1), r1=84(y1), r2=351(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 84
LDI r2, 351
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
