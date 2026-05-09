; DESCRIPTION: Places a black line segment connecting (353, 198) to (114, 95).
; PLAN: r0=353(x1), r1=198(y1), r2=114(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 198
LDI r2, 114
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
