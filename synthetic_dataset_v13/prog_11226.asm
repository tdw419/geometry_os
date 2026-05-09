; DESCRIPTION: Renders a black line between points (236, 136) and (292, 176).
; PLAN: r0=236(x1), r1=136(y1), r2=292(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 136
LDI r2, 292
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
