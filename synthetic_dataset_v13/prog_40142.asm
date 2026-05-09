; DESCRIPTION: Places a green line segment connecting (493, 24) to (371, 190).
; PLAN: r0=493(x1), r1=24(y1), r2=371(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 24
LDI r2, 371
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
