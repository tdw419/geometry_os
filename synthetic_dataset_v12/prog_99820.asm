; DESCRIPTION: Places a black line segment connecting (346, 108) to (348, 39).
; PLAN: r0=346(x1), r1=108(y1), r2=348(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 108
LDI r2, 348
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
