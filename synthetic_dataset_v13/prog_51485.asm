; DESCRIPTION: Renders a purple line between points (290, 59) and (74, 183).
; PLAN: r0=290(x1), r1=59(y1), r2=74(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 59
LDI r2, 74
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
