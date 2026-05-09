; DESCRIPTION: Places a black line segment connecting (509, 254) to (252, 12).
; PLAN: r0=509(x1), r1=254(y1), r2=252(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 254
LDI r2, 252
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
