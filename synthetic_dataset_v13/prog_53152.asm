; DESCRIPTION: Places a green line segment connecting (486, 202) to (379, 54).
; PLAN: r0=486(x1), r1=202(y1), r2=379(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 202
LDI r2, 379
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
