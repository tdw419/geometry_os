; DESCRIPTION: Places a purple line segment connecting (72, 195) to (493, 242).
; PLAN: r0=72(x1), r1=195(y1), r2=493(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 195
LDI r2, 493
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
