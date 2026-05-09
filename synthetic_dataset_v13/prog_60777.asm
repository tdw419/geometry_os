; DESCRIPTION: Places a black line segment connecting (138, 136) to (339, 186).
; PLAN: r0=138(x1), r1=136(y1), r2=339(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 136
LDI r2, 339
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
