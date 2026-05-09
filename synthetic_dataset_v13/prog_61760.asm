; DESCRIPTION: Places a green line segment connecting (151, 11) to (371, 121).
; PLAN: r0=151(x1), r1=11(y1), r2=371(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 11
LDI r2, 371
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
