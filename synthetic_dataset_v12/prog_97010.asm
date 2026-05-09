; DESCRIPTION: Renders a black line between points (212, 246) and (58, 161).
; PLAN: r0=212(x1), r1=246(y1), r2=58(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 246
LDI r2, 58
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
