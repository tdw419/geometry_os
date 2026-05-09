; DESCRIPTION: Places a black line segment connecting (278, 8) to (240, 30).
; PLAN: r0=278(x1), r1=8(y1), r2=240(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 8
LDI r2, 240
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
