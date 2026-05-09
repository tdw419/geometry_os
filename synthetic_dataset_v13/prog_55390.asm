; DESCRIPTION: Renders a black line between points (275, 129) and (114, 106).
; PLAN: r0=275(x1), r1=129(y1), r2=114(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 129
LDI r2, 114
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
