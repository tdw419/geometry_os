; DESCRIPTION: Places a green line segment connecting (320, 95) to (423, 222).
; PLAN: r0=320(x1), r1=95(y1), r2=423(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 95
LDI r2, 423
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
