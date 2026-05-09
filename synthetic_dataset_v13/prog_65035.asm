; DESCRIPTION: Renders a yellow line between points (339, 91) and (261, 180).
; PLAN: r0=339(x1), r1=91(y1), r2=261(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 91
LDI r2, 261
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
