; DESCRIPTION: Renders a black line between points (53, 175) and (8, 233).
; PLAN: r0=53(x1), r1=175(y1), r2=8(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 175
LDI r2, 8
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
