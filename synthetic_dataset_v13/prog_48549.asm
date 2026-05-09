; DESCRIPTION: Places a black line segment connecting (454, 1) to (475, 173).
; PLAN: r0=454(x1), r1=1(y1), r2=475(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 1
LDI r2, 475
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
