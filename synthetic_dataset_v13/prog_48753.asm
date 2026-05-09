; DESCRIPTION: Places a yellow line segment connecting (474, 231) to (104, 176).
; PLAN: r0=474(x1), r1=231(y1), r2=104(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 231
LDI r2, 104
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
