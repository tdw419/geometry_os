; DESCRIPTION: Places a black line segment connecting (143, 239) to (119, 189).
; PLAN: r0=143(x1), r1=239(y1), r2=119(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 239
LDI r2, 119
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
