; DESCRIPTION: Renders a yellow line between points (241, 71) and (19, 250).
; PLAN: r0=241(x1), r1=71(y1), r2=19(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 71
LDI r2, 19
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
