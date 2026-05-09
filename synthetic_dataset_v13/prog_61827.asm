; DESCRIPTION: Renders a yellow line between points (349, 125) and (469, 66).
; PLAN: r0=349(x1), r1=125(y1), r2=469(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 125
LDI r2, 469
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
