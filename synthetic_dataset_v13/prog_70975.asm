; DESCRIPTION: Renders a purple line between points (443, 144) and (182, 156).
; PLAN: r0=443(x1), r1=144(y1), r2=182(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 144
LDI r2, 182
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
