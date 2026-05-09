; DESCRIPTION: Renders a black line between points (130, 129) and (157, 11).
; PLAN: r0=130(x1), r1=129(y1), r2=157(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 129
LDI r2, 157
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
