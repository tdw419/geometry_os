; DESCRIPTION: Places a black line segment connecting (64, 180) to (245, 30).
; PLAN: r0=64(x1), r1=180(y1), r2=245(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 180
LDI r2, 245
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
