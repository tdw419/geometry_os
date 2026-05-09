; DESCRIPTION: Places a green line segment connecting (59, 157) to (119, 240).
; PLAN: r0=59(x1), r1=157(y1), r2=119(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 157
LDI r2, 119
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
