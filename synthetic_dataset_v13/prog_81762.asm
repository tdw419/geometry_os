; DESCRIPTION: Places a yellow line segment connecting (320, 157) to (258, 50).
; PLAN: r0=320(x1), r1=157(y1), r2=258(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 157
LDI r2, 258
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
