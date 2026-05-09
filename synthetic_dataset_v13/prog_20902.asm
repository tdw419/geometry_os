; DESCRIPTION: Places a yellow line segment connecting (493, 7) to (323, 160).
; PLAN: r0=493(x1), r1=7(y1), r2=323(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 7
LDI r2, 323
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
