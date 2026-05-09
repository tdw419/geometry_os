; DESCRIPTION: Renders a yellow line between points (175, 114) and (501, 251).
; PLAN: r0=175(x1), r1=114(y1), r2=501(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 114
LDI r2, 501
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
