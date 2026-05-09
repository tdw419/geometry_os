; DESCRIPTION: Renders a black line between points (13, 0) and (306, 86).
; PLAN: r0=13(x1), r1=0(y1), r2=306(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 0
LDI r2, 306
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
