; DESCRIPTION: Renders a black line between points (456, 172) and (105, 23).
; PLAN: r0=456(x1), r1=172(y1), r2=105(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 172
LDI r2, 105
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
