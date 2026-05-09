; DESCRIPTION: Places a black line segment connecting (32, 63) to (67, 19).
; PLAN: r0=32(x1), r1=63(y1), r2=67(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 63
LDI r2, 67
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
