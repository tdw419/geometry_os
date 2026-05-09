; DESCRIPTION: Renders a red line between points (91, 58) and (483, 53).
; PLAN: r0=91(x1), r1=58(y1), r2=483(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 58
LDI r2, 483
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
