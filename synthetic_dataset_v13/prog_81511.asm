; DESCRIPTION: Places a black line segment connecting (310, 224) to (463, 239).
; PLAN: r0=310(x1), r1=224(y1), r2=463(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 224
LDI r2, 463
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
