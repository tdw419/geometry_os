; DESCRIPTION: Places a green line segment connecting (8, 114) to (100, 57).
; PLAN: r0=8(x1), r1=114(y1), r2=100(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 114
LDI r2, 100
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
