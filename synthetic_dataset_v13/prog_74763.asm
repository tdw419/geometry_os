; DESCRIPTION: Places a black line segment connecting (416, 176) to (475, 234).
; PLAN: r0=416(x1), r1=176(y1), r2=475(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 176
LDI r2, 475
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
