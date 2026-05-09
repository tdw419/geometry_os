; DESCRIPTION: Places a green line segment connecting (469, 131) to (295, 201).
; PLAN: r0=469(x1), r1=131(y1), r2=295(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 131
LDI r2, 295
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
