; DESCRIPTION: Renders a magenta line between points (358, 221) and (339, 216).
; PLAN: r0=358(x1), r1=221(y1), r2=339(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 221
LDI r2, 339
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
