; DESCRIPTION: Renders a orange line between points (188, 220) and (58, 167).
; PLAN: r0=188(x1), r1=220(y1), r2=58(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 220
LDI r2, 58
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
