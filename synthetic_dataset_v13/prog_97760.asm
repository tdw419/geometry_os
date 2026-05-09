; DESCRIPTION: Places a blue line segment connecting (362, 40) to (468, 139).
; PLAN: r0=362(x1), r1=40(y1), r2=468(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 40
LDI r2, 468
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
