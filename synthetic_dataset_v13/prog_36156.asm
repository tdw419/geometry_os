; DESCRIPTION: Renders a green line between points (232, 162) and (246, 167).
; PLAN: r0=232(x1), r1=162(y1), r2=246(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 162
LDI r2, 246
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
