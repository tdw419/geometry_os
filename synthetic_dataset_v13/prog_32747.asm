; DESCRIPTION: Renders a black line between points (348, 90) and (355, 150).
; PLAN: r0=348(x1), r1=90(y1), r2=355(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 90
LDI r2, 355
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
