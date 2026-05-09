; DESCRIPTION: Places a black line segment connecting (68, 199) to (329, 206).
; PLAN: r0=68(x1), r1=199(y1), r2=329(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 199
LDI r2, 329
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
