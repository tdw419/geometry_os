; DESCRIPTION: Renders a black line between points (428, 15) and (137, 243).
; PLAN: r0=428(x1), r1=15(y1), r2=137(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 15
LDI r2, 137
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
