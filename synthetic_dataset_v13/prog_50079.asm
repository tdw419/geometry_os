; DESCRIPTION: Places a black line segment connecting (37, 59) to (212, 204).
; PLAN: r0=37(x1), r1=59(y1), r2=212(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 59
LDI r2, 212
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
