; DESCRIPTION: Renders a black line between points (436, 123) and (291, 49).
; PLAN: r0=436(x1), r1=123(y1), r2=291(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 123
LDI r2, 291
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
