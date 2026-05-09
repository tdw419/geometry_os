; DESCRIPTION: Renders a yellow line between points (454, 15) and (101, 95).
; PLAN: r0=454(x1), r1=15(y1), r2=101(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 15
LDI r2, 101
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
