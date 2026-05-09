; DESCRIPTION: Renders a yellow line between points (122, 71) and (98, 234).
; PLAN: r0=122(x1), r1=71(y1), r2=98(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 71
LDI r2, 98
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
