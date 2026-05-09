; DESCRIPTION: Renders a yellow line between points (366, 13) and (222, 95).
; PLAN: r0=366(x1), r1=13(y1), r2=222(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 13
LDI r2, 222
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
