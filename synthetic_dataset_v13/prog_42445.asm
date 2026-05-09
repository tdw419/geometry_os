; DESCRIPTION: Renders a magenta line between points (246, 36) and (170, 31).
; PLAN: r0=246(x1), r1=36(y1), r2=170(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 36
LDI r2, 170
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
