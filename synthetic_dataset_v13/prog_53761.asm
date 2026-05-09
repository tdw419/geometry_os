; DESCRIPTION: Places a black line segment connecting (228, 123) to (139, 239).
; PLAN: r0=228(x1), r1=123(y1), r2=139(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 123
LDI r2, 139
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
