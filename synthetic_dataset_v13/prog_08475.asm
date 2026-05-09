; DESCRIPTION: Places a white line segment connecting (319, 92) to (345, 208).
; PLAN: r0=319(x1), r1=92(y1), r2=345(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 92
LDI r2, 345
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
