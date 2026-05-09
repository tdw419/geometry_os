; DESCRIPTION: Places a black line segment connecting (274, 63) to (58, 206).
; PLAN: r0=274(x1), r1=63(y1), r2=58(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 63
LDI r2, 58
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
