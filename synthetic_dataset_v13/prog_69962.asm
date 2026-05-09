; DESCRIPTION: Renders a black line between points (509, 133) and (486, 193).
; PLAN: r0=509(x1), r1=133(y1), r2=486(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 133
LDI r2, 486
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
