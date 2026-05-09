; DESCRIPTION: Renders a black line between points (21, 174) and (269, 41).
; PLAN: r0=21(x1), r1=174(y1), r2=269(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 174
LDI r2, 269
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
