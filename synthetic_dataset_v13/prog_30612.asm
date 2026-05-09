; DESCRIPTION: Renders a purple line between points (281, 101) and (210, 60).
; PLAN: r0=281(x1), r1=101(y1), r2=210(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 101
LDI r2, 210
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
