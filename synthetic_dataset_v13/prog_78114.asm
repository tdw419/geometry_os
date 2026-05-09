; DESCRIPTION: Renders a red line between points (38, 36) and (307, 105).
; PLAN: r0=38(x1), r1=36(y1), r2=307(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 36
LDI r2, 307
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
