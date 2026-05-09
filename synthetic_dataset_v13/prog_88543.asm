; DESCRIPTION: Renders a yellow line between points (23, 238) and (52, 156).
; PLAN: r0=23(x1), r1=238(y1), r2=52(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 238
LDI r2, 52
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
