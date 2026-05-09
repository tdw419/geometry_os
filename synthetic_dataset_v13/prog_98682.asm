; DESCRIPTION: Places a black line segment connecting (376, 237) to (299, 29).
; PLAN: r0=376(x1), r1=237(y1), r2=299(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 237
LDI r2, 299
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
