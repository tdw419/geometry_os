; DESCRIPTION: Places a green line segment connecting (62, 255) to (44, 60).
; PLAN: r0=62(x1), r1=255(y1), r2=44(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 255
LDI r2, 44
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
