; DESCRIPTION: Places a black line segment connecting (126, 114) to (291, 33).
; PLAN: r0=126(x1), r1=114(y1), r2=291(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 114
LDI r2, 291
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
