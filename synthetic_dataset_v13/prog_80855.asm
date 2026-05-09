; DESCRIPTION: Places a black line segment connecting (246, 29) to (90, 250).
; PLAN: r0=246(x1), r1=29(y1), r2=90(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 29
LDI r2, 90
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
