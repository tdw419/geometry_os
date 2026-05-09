; DESCRIPTION: Places a green line segment connecting (15, 76) to (44, 135).
; PLAN: r0=15(x1), r1=76(y1), r2=44(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 76
LDI r2, 44
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
