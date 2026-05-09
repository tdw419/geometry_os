; DESCRIPTION: Places a black line segment connecting (482, 60) to (250, 255).
; PLAN: r0=482(x1), r1=60(y1), r2=250(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 60
LDI r2, 250
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
