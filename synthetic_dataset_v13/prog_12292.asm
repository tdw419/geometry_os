; DESCRIPTION: Places a black line segment connecting (427, 36) to (482, 95).
; PLAN: r0=427(x1), r1=36(y1), r2=482(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 36
LDI r2, 482
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
