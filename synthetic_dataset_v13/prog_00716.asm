; DESCRIPTION: Renders a orange line between points (188, 187) and (261, 169).
; PLAN: r0=188(x1), r1=187(y1), r2=261(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 187
LDI r2, 261
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
