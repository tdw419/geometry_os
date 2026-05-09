; DESCRIPTION: Places a black line segment connecting (383, 12) to (415, 155).
; PLAN: r0=383(x1), r1=12(y1), r2=415(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 12
LDI r2, 415
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
