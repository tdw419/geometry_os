; DESCRIPTION: Places a black line segment connecting (173, 184) to (1, 187).
; PLAN: r0=173(x1), r1=184(y1), r2=1(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 184
LDI r2, 1
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
