; DESCRIPTION: Renders a black line between points (244, 6) and (27, 170).
; PLAN: r0=244(x1), r1=6(y1), r2=27(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 6
LDI r2, 27
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
