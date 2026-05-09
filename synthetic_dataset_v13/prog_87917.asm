; DESCRIPTION: Renders a black line between points (477, 159) and (39, 193).
; PLAN: r0=477(x1), r1=159(y1), r2=39(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 159
LDI r2, 39
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
