; DESCRIPTION: Places a black line segment connecting (173, 180) to (331, 151).
; PLAN: r0=173(x1), r1=180(y1), r2=331(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 180
LDI r2, 331
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
