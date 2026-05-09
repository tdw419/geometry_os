; DESCRIPTION: Renders a black line between points (285, 213) and (427, 96).
; PLAN: r0=285(x1), r1=213(y1), r2=427(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 213
LDI r2, 427
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
