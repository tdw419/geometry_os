; DESCRIPTION: Renders a purple line between points (54, 226) and (182, 134).
; PLAN: r0=54(x1), r1=226(y1), r2=182(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 226
LDI r2, 182
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
