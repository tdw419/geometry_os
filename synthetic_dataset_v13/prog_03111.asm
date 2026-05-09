; DESCRIPTION: Renders a yellow line between points (197, 237) and (246, 216).
; PLAN: r0=197(x1), r1=237(y1), r2=246(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 237
LDI r2, 246
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
