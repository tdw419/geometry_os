; DESCRIPTION: Places a black line segment connecting (73, 84) to (379, 192).
; PLAN: r0=73(x1), r1=84(y1), r2=379(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 84
LDI r2, 379
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
