; DESCRIPTION: Places a green line segment connecting (208, 201) to (436, 182).
; PLAN: r0=208(x1), r1=201(y1), r2=436(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 201
LDI r2, 436
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
