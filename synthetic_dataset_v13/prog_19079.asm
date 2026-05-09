; DESCRIPTION: Renders a black line between points (486, 140) and (107, 220).
; PLAN: r0=486(x1), r1=140(y1), r2=107(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 140
LDI r2, 107
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
