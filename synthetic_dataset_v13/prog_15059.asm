; DESCRIPTION: Places a blue line segment connecting (88, 234) to (74, 111).
; PLAN: r0=88(x1), r1=234(y1), r2=74(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 234
LDI r2, 74
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
