; DESCRIPTION: Places a green line segment connecting (34, 202) to (320, 78).
; PLAN: r0=34(x1), r1=202(y1), r2=320(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 202
LDI r2, 320
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
