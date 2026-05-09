; DESCRIPTION: Places a green line segment connecting (89, 253) to (486, 61).
; PLAN: r0=89(x1), r1=253(y1), r2=486(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 253
LDI r2, 486
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
