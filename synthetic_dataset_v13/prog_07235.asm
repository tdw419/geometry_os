; DESCRIPTION: Places a yellow line segment connecting (25, 71) to (493, 241).
; PLAN: r0=25(x1), r1=71(y1), r2=493(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 71
LDI r2, 493
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
