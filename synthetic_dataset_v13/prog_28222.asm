; DESCRIPTION: Places a yellow line segment connecting (443, 233) to (371, 62).
; PLAN: r0=443(x1), r1=233(y1), r2=371(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 233
LDI r2, 371
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
