; DESCRIPTION: Renders a red line between points (170, 176) and (326, 53).
; PLAN: r0=170(x1), r1=176(y1), r2=326(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 176
LDI r2, 326
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
