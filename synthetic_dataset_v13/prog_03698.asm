; DESCRIPTION: Places a green line segment connecting (131, 86) to (286, 158).
; PLAN: r0=131(x1), r1=86(y1), r2=286(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 86
LDI r2, 286
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
