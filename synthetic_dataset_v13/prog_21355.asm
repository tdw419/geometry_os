; DESCRIPTION: Places a yellow line segment connecting (493, 116) to (498, 52).
; PLAN: r0=493(x1), r1=116(y1), r2=498(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 116
LDI r2, 498
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
