; DESCRIPTION: Renders a yellow line between points (453, 213) and (190, 93).
; PLAN: r0=453(x1), r1=213(y1), r2=190(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 213
LDI r2, 190
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
