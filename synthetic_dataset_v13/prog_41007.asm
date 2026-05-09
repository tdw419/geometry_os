; DESCRIPTION: Renders a green line between points (211, 71) and (353, 203).
; PLAN: r0=211(x1), r1=71(y1), r2=353(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 71
LDI r2, 353
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
