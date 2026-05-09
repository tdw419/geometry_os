; DESCRIPTION: Places a yellow line segment connecting (331, 77) to (59, 195).
; PLAN: r0=331(x1), r1=77(y1), r2=59(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 77
LDI r2, 59
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
