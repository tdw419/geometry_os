; DESCRIPTION: Places a black line segment connecting (184, 22) to (354, 254).
; PLAN: r0=184(x1), r1=22(y1), r2=354(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 22
LDI r2, 354
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
