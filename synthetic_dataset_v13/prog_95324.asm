; DESCRIPTION: Places a black line segment connecting (232, 70) to (367, 222).
; PLAN: r0=232(x1), r1=70(y1), r2=367(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 70
LDI r2, 367
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
