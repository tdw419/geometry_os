; DESCRIPTION: Renders a black line between points (153, 129) and (41, 243).
; PLAN: r0=153(x1), r1=129(y1), r2=41(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 129
LDI r2, 41
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
