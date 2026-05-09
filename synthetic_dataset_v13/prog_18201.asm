; DESCRIPTION: Renders a black line between points (179, 219) and (505, 87).
; PLAN: r0=179(x1), r1=219(y1), r2=505(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 219
LDI r2, 505
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
