; DESCRIPTION: Places a black line segment connecting (433, 191) to (294, 101).
; PLAN: r0=433(x1), r1=191(y1), r2=294(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 191
LDI r2, 294
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
