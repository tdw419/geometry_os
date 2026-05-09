; DESCRIPTION: Places a yellow line segment connecting (493, 15) to (202, 55).
; PLAN: r0=493(x1), r1=15(y1), r2=202(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 15
LDI r2, 202
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
