; DESCRIPTION: Places a green line segment connecting (97, 59) to (498, 194).
; PLAN: r0=97(x1), r1=59(y1), r2=498(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 59
LDI r2, 498
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
