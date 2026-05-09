; DESCRIPTION: Places a black line segment connecting (500, 20) to (64, 173).
; PLAN: r0=500(x1), r1=20(y1), r2=64(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 20
LDI r2, 64
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
