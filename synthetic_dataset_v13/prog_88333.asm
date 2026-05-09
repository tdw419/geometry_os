; DESCRIPTION: Places a green line segment connecting (372, 155) to (474, 35).
; PLAN: r0=372(x1), r1=155(y1), r2=474(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 155
LDI r2, 474
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
