; DESCRIPTION: Renders a purple line between points (265, 213) and (71, 169).
; PLAN: r0=265(x1), r1=213(y1), r2=71(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 213
LDI r2, 71
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
