; DESCRIPTION: Places a black line segment connecting (297, 154) to (336, 151).
; PLAN: r0=297(x1), r1=154(y1), r2=336(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 154
LDI r2, 336
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
