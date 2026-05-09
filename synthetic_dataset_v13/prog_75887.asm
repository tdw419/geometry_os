; DESCRIPTION: Renders a black line between points (366, 240) and (406, 11).
; PLAN: r0=366(x1), r1=240(y1), r2=406(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 240
LDI r2, 406
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
