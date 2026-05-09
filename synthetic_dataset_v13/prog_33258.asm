; DESCRIPTION: Renders a purple line between points (389, 228) and (25, 170).
; PLAN: r0=389(x1), r1=228(y1), r2=25(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 228
LDI r2, 25
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
