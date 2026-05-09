; DESCRIPTION: Places a black line segment connecting (115, 85) to (291, 198).
; PLAN: r0=115(x1), r1=85(y1), r2=291(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 85
LDI r2, 291
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
