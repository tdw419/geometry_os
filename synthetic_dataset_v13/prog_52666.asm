; DESCRIPTION: Renders a purple line between points (63, 221) and (460, 78).
; PLAN: r0=63(x1), r1=221(y1), r2=460(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 221
LDI r2, 460
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
