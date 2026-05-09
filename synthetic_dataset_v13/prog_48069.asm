; DESCRIPTION: Renders a black line between points (140, 19) and (458, 60).
; PLAN: r0=140(x1), r1=19(y1), r2=458(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 19
LDI r2, 458
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
