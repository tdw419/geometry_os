; DESCRIPTION: Places a black line segment connecting (326, 109) to (310, 43).
; PLAN: r0=326(x1), r1=109(y1), r2=310(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 109
LDI r2, 310
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
