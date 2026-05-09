; DESCRIPTION: Places a yellow line segment connecting (493, 92) to (107, 179).
; PLAN: r0=493(x1), r1=92(y1), r2=107(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 92
LDI r2, 107
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
