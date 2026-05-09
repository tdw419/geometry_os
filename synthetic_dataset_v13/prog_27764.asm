; DESCRIPTION: Renders a yellow line between points (510, 246) and (34, 172).
; PLAN: r0=510(x1), r1=246(y1), r2=34(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 246
LDI r2, 34
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
