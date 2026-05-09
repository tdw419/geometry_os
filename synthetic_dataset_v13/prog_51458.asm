; DESCRIPTION: Renders a white line between points (265, 127) and (155, 203).
; PLAN: r0=265(x1), r1=127(y1), r2=155(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 127
LDI r2, 155
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
