; DESCRIPTION: Renders a red line between points (355, 154) and (67, 97).
; PLAN: r0=355(x1), r1=154(y1), r2=67(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 154
LDI r2, 67
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
