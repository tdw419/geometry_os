; DESCRIPTION: Renders a yellow line between points (495, 187) and (34, 53).
; PLAN: r0=495(x1), r1=187(y1), r2=34(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 187
LDI r2, 34
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
