; DESCRIPTION: Renders a orange line between points (493, 191) and (511, 242).
; PLAN: r0=493(x1), r1=191(y1), r2=511(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 191
LDI r2, 511
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
