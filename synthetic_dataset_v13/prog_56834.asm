; DESCRIPTION: Renders a yellow line between points (493, 64) and (211, 18).
; PLAN: r0=493(x1), r1=64(y1), r2=211(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 64
LDI r2, 211
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
