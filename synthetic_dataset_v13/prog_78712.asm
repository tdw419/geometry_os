; DESCRIPTION: Places a black line segment connecting (474, 180) to (320, 157).
; PLAN: r0=474(x1), r1=180(y1), r2=320(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 180
LDI r2, 320
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
