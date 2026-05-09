; DESCRIPTION: Renders a yellow line between points (482, 115) and (20, 49).
; PLAN: r0=482(x1), r1=115(y1), r2=20(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 115
LDI r2, 20
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
