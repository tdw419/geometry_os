; DESCRIPTION: Places a black line segment connecting (140, 103) to (339, 61).
; PLAN: r0=140(x1), r1=103(y1), r2=339(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 103
LDI r2, 339
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
