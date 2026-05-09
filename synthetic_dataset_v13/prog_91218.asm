; DESCRIPTION: Places a black line segment connecting (176, 90) to (96, 254).
; PLAN: r0=176(x1), r1=90(y1), r2=96(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 90
LDI r2, 96
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
