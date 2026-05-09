; DESCRIPTION: Renders a yellow line between points (52, 110) and (64, 39).
; PLAN: r0=52(x1), r1=110(y1), r2=64(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 110
LDI r2, 64
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
