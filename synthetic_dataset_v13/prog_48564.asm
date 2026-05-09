; DESCRIPTION: Renders a yellow line between points (484, 101) and (329, 70).
; PLAN: r0=484(x1), r1=101(y1), r2=329(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 101
LDI r2, 329
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
