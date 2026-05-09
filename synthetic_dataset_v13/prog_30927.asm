; DESCRIPTION: Places a black line segment connecting (336, 29) to (373, 142).
; PLAN: r0=336(x1), r1=29(y1), r2=373(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 29
LDI r2, 373
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
