; DESCRIPTION: Renders a yellow line between points (252, 141) and (447, 49).
; PLAN: r0=252(x1), r1=141(y1), r2=447(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 141
LDI r2, 447
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
