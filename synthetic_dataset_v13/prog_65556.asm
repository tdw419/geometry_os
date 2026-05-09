; DESCRIPTION: Renders a red line between points (94, 20) and (307, 53).
; PLAN: r0=94(x1), r1=20(y1), r2=307(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 20
LDI r2, 307
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
