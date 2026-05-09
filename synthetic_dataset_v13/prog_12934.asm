; DESCRIPTION: Places a green line segment connecting (239, 30) to (100, 218).
; PLAN: r0=239(x1), r1=30(y1), r2=100(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 30
LDI r2, 100
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
