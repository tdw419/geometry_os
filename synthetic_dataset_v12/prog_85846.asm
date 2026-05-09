; DESCRIPTION: Places a black line segment connecting (256, 6) to (0, 192).
; PLAN: r0=256(x1), r1=6(y1), r2=0(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 6
LDI r2, 0
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
