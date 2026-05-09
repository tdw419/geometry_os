; DESCRIPTION: Places a black line segment connecting (433, 84) to (255, 14).
; PLAN: r0=433(x1), r1=84(y1), r2=255(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 84
LDI r2, 255
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
