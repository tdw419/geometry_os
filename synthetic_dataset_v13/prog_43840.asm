; DESCRIPTION: Renders a green line between points (355, 114) and (212, 53).
; PLAN: r0=355(x1), r1=114(y1), r2=212(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 114
LDI r2, 212
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
