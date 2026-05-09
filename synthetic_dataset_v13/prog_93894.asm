; DESCRIPTION: Renders a black line between points (458, 60) and (28, 247).
; PLAN: r0=458(x1), r1=60(y1), r2=28(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 60
LDI r2, 28
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
