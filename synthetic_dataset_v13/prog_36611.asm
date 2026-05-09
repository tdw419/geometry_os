; DESCRIPTION: Places a yellow line segment connecting (493, 168) to (373, 198).
; PLAN: r0=493(x1), r1=168(y1), r2=373(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 168
LDI r2, 373
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
