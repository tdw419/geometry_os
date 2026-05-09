; DESCRIPTION: Renders a yellow line between points (7, 74) and (47, 127).
; PLAN: r0=7(x1), r1=74(y1), r2=47(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 74
LDI r2, 47
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
