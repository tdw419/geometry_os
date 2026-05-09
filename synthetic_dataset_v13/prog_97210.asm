; DESCRIPTION: Places a black line segment connecting (498, 103) to (188, 218).
; PLAN: r0=498(x1), r1=103(y1), r2=188(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 103
LDI r2, 188
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
