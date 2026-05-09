; DESCRIPTION: Places a black line segment connecting (74, 237) to (376, 234).
; PLAN: r0=74(x1), r1=237(y1), r2=376(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 237
LDI r2, 376
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
