; DESCRIPTION: Renders a purple line between points (46, 166) and (403, 190).
; PLAN: r0=46(x1), r1=166(y1), r2=403(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 166
LDI r2, 403
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
