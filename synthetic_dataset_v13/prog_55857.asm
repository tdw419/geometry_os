; DESCRIPTION: Places a black line segment connecting (227, 220) to (499, 246).
; PLAN: r0=227(x1), r1=220(y1), r2=499(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 220
LDI r2, 499
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
