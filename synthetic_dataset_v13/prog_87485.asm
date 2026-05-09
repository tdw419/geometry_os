; DESCRIPTION: Renders a black line between points (380, 62) and (399, 144).
; PLAN: r0=380(x1), r1=62(y1), r2=399(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 62
LDI r2, 399
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
