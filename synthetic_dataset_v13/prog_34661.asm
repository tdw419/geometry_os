; DESCRIPTION: Renders a yellow line between points (306, 134) and (66, 207).
; PLAN: r0=306(x1), r1=134(y1), r2=66(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 134
LDI r2, 66
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
