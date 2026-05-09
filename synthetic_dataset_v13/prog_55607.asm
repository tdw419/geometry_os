; DESCRIPTION: Renders a black line between points (75, 0) and (99, 90).
; PLAN: r0=75(x1), r1=0(y1), r2=99(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 0
LDI r2, 99
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
