; DESCRIPTION: Places a blue line segment connecting (368, 7) to (350, 190).
; PLAN: r0=368(x1), r1=7(y1), r2=350(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 7
LDI r2, 350
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
