; DESCRIPTION: Places a yellow line segment connecting (474, 206) to (203, 245).
; PLAN: r0=474(x1), r1=206(y1), r2=203(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 206
LDI r2, 203
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
