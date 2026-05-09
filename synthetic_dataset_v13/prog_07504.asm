; DESCRIPTION: Places a red line segment connecting (416, 91) to (62, 192).
; PLAN: r0=416(x1), r1=91(y1), r2=62(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 91
LDI r2, 62
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
