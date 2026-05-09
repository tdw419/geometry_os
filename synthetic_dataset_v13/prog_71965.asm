; DESCRIPTION: Places a black line segment connecting (183, 155) to (482, 223).
; PLAN: r0=183(x1), r1=155(y1), r2=482(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 155
LDI r2, 482
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
