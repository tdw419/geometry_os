; DESCRIPTION: Renders a black line between points (78, 47) and (426, 171).
; PLAN: r0=78(x1), r1=47(y1), r2=426(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 47
LDI r2, 426
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
