; DESCRIPTION: Places a black line segment connecting (189, 37) to (219, 42).
; PLAN: r0=189(x1), r1=37(y1), r2=219(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 37
LDI r2, 219
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
