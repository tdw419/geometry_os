; DESCRIPTION: Places a black line segment connecting (493, 242) to (31, 1).
; PLAN: r0=493(x1), r1=242(y1), r2=31(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 242
LDI r2, 31
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
