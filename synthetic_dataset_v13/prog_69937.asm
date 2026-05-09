; DESCRIPTION: Places a white line segment connecting (291, 154) to (4, 254).
; PLAN: r0=291(x1), r1=154(y1), r2=4(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 154
LDI r2, 4
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
