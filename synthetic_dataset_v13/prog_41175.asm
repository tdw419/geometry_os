; DESCRIPTION: Places a green line segment connecting (138, 153) to (278, 64).
; PLAN: r0=138(x1), r1=153(y1), r2=278(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 153
LDI r2, 278
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
