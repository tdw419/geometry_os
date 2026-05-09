; DESCRIPTION: Draws a black line from (186, 136) to (343, 12).
; PLAN: r0=186(x1), r1=136(y1), r2=343(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 136
LDI r2, 343
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
