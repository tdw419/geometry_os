; DESCRIPTION: Renders a black line between points (8, 217) and (72, 61).
; PLAN: r0=8(x1), r1=217(y1), r2=72(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 217
LDI r2, 72
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
