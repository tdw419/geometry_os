; DESCRIPTION: Places a black line segment connecting (93, 152) to (64, 142).
; PLAN: r0=93(x1), r1=152(y1), r2=64(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 152
LDI r2, 64
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
