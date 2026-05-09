; DESCRIPTION: Renders a yellow line between points (64, 195) and (427, 1).
; PLAN: r0=64(x1), r1=195(y1), r2=427(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 195
LDI r2, 427
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
