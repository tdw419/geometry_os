; DESCRIPTION: Places a purple line segment connecting (104, 70) to (1, 111).
; PLAN: r0=104(x1), r1=70(y1), r2=1(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 70
LDI r2, 1
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
