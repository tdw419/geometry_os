; DESCRIPTION: Renders a yellow line between points (334, 175) and (174, 230).
; PLAN: r0=334(x1), r1=175(y1), r2=174(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 175
LDI r2, 174
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
