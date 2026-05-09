; DESCRIPTION: Places a black line segment connecting (469, 159) to (72, 29).
; PLAN: r0=469(x1), r1=159(y1), r2=72(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 159
LDI r2, 72
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
