; DESCRIPTION: Renders a yellow line between points (292, 167) and (158, 229).
; PLAN: r0=292(x1), r1=167(y1), r2=158(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 167
LDI r2, 158
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
