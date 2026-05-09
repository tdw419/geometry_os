; DESCRIPTION: Places a black line segment connecting (26, 205) to (219, 219).
; PLAN: r0=26(x1), r1=205(y1), r2=219(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 205
LDI r2, 219
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
