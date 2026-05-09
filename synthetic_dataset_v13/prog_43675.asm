; DESCRIPTION: Renders a black line between points (247, 34) and (433, 251).
; PLAN: r0=247(x1), r1=34(y1), r2=433(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 34
LDI r2, 433
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
