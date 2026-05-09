; DESCRIPTION: Places a yellow line segment connecting (51, 99) to (236, 139).
; PLAN: r0=51(x1), r1=99(y1), r2=236(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 99
LDI r2, 236
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
