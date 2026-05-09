; DESCRIPTION: Renders a black line between points (447, 187) and (55, 22).
; PLAN: r0=447(x1), r1=187(y1), r2=55(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 187
LDI r2, 55
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
