; DESCRIPTION: Places a green line segment connecting (289, 214) to (43, 151).
; PLAN: r0=289(x1), r1=214(y1), r2=43(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 214
LDI r2, 43
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
