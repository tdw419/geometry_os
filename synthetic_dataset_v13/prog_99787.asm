; DESCRIPTION: Renders a black line between points (459, 24) and (8, 243).
; PLAN: r0=459(x1), r1=24(y1), r2=8(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 24
LDI r2, 8
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
