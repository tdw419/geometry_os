; DESCRIPTION: Renders a black line between points (28, 210) and (98, 245).
; PLAN: r0=28(x1), r1=210(y1), r2=98(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 210
LDI r2, 98
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
