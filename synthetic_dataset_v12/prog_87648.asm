; DESCRIPTION: Renders a black line between points (268, 179) and (444, 43).
; PLAN: r0=268(x1), r1=179(y1), r2=444(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 179
LDI r2, 444
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
