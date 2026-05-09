; DESCRIPTION: Places a black line segment connecting (216, 43) to (418, 210).
; PLAN: r0=216(x1), r1=43(y1), r2=418(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 43
LDI r2, 418
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
