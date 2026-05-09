; DESCRIPTION: Places a green line segment connecting (466, 82) to (310, 194).
; PLAN: r0=466(x1), r1=82(y1), r2=310(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 82
LDI r2, 310
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
