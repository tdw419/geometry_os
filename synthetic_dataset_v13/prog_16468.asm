; DESCRIPTION: Places a black line segment connecting (18, 173) to (105, 80).
; PLAN: r0=18(x1), r1=173(y1), r2=105(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 173
LDI r2, 105
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
