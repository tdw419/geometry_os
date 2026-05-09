; DESCRIPTION: Places a black line segment connecting (255, 78) to (475, 182).
; PLAN: r0=255(x1), r1=78(y1), r2=475(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 78
LDI r2, 475
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
