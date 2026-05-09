; DESCRIPTION: Places a purple line segment connecting (90, 44) to (320, 85).
; PLAN: r0=90(x1), r1=44(y1), r2=320(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 44
LDI r2, 320
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
