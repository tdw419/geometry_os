; DESCRIPTION: Renders a green line between points (483, 203) and (143, 167).
; PLAN: r0=483(x1), r1=203(y1), r2=143(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 203
LDI r2, 143
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
