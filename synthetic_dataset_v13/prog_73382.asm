; DESCRIPTION: Renders a yellow line between points (306, 174) and (281, 254).
; PLAN: r0=306(x1), r1=174(y1), r2=281(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 174
LDI r2, 281
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
