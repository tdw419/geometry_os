; DESCRIPTION: Renders a black line between points (4, 13) and (248, 3).
; PLAN: r0=4(x1), r1=13(y1), r2=248(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 13
LDI r2, 248
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
