; DESCRIPTION: Places a white line segment connecting (362, 250) to (141, 58).
; PLAN: r0=362(x1), r1=250(y1), r2=141(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 250
LDI r2, 141
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
