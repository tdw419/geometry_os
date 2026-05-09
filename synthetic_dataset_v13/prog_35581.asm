; DESCRIPTION: Places a black line segment connecting (38, 11) to (239, 252).
; PLAN: r0=38(x1), r1=11(y1), r2=239(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 11
LDI r2, 239
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
