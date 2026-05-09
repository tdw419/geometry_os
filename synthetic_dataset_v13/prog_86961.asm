; DESCRIPTION: Places a black line segment connecting (320, 34) to (385, 181).
; PLAN: r0=320(x1), r1=34(y1), r2=385(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 34
LDI r2, 385
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
