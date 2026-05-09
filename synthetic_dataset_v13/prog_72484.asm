; DESCRIPTION: Renders a black line between points (332, 119) and (446, 156).
; PLAN: r0=332(x1), r1=119(y1), r2=446(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 119
LDI r2, 446
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
