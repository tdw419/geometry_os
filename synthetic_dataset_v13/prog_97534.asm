; DESCRIPTION: Renders a yellow line between points (66, 40) and (14, 187).
; PLAN: r0=66(x1), r1=40(y1), r2=14(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 40
LDI r2, 14
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
