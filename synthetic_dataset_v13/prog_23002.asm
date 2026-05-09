; DESCRIPTION: Renders a green line between points (292, 246) and (339, 208).
; PLAN: r0=292(x1), r1=246(y1), r2=339(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 246
LDI r2, 339
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
