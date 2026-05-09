; DESCRIPTION: Places a green line segment connecting (137, 32) to (189, 120).
; PLAN: r0=137(x1), r1=32(y1), r2=189(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 32
LDI r2, 189
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
