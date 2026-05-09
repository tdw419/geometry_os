; DESCRIPTION: Draws a black line from (253, 29) to (86, 106).
; PLAN: r0=253(x1), r1=29(y1), r2=86(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 29
LDI r2, 86
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
