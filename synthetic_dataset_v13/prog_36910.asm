; DESCRIPTION: Renders a black line between points (139, 97) and (299, 31).
; PLAN: r0=139(x1), r1=97(y1), r2=299(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 97
LDI r2, 299
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
