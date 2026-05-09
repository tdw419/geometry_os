; DESCRIPTION: Renders a black line between points (40, 207) and (498, 251).
; PLAN: r0=40(x1), r1=207(y1), r2=498(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 207
LDI r2, 498
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
