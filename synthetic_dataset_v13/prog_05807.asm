; DESCRIPTION: Places a black line segment connecting (442, 209) to (426, 67).
; PLAN: r0=442(x1), r1=209(y1), r2=426(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 209
LDI r2, 426
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
