; DESCRIPTION: Places a black line segment connecting (278, 139) to (237, 164).
; PLAN: r0=278(x1), r1=139(y1), r2=237(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 139
LDI r2, 237
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
