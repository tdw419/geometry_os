; DESCRIPTION: Places a black line segment connecting (318, 173) to (110, 8).
; PLAN: r0=318(x1), r1=173(y1), r2=110(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 173
LDI r2, 110
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
