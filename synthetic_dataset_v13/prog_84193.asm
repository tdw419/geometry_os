; DESCRIPTION: Places a green line segment connecting (411, 208) to (241, 131).
; PLAN: r0=411(x1), r1=208(y1), r2=241(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 208
LDI r2, 241
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
