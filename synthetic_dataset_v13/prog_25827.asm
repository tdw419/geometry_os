; DESCRIPTION: Renders a black line between points (160, 164) and (265, 245).
; PLAN: r0=160(x1), r1=164(y1), r2=265(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 164
LDI r2, 265
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
