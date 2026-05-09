; DESCRIPTION: Renders a black line between points (115, 163) and (144, 214).
; PLAN: r0=115(x1), r1=163(y1), r2=144(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 163
LDI r2, 144
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
