; DESCRIPTION: Places a green line segment connecting (102, 142) to (320, 245).
; PLAN: r0=102(x1), r1=142(y1), r2=320(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 142
LDI r2, 320
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
