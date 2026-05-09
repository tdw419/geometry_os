; DESCRIPTION: Renders a black line between points (110, 248) and (101, 179).
; PLAN: r0=110(x1), r1=248(y1), r2=101(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 248
LDI r2, 101
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
