; DESCRIPTION: Places a green line segment connecting (362, 211) to (11, 157).
; PLAN: r0=362(x1), r1=211(y1), r2=11(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 211
LDI r2, 11
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
