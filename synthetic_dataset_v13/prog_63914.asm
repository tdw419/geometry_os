; DESCRIPTION: Places a black line segment connecting (494, 81) to (258, 43).
; PLAN: r0=494(x1), r1=81(y1), r2=258(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 81
LDI r2, 258
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
