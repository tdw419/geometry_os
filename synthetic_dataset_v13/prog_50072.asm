; DESCRIPTION: Places a blue line segment connecting (321, 182) to (493, 31).
; PLAN: r0=321(x1), r1=182(y1), r2=493(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 182
LDI r2, 493
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
