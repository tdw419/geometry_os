; DESCRIPTION: Renders a magenta line between points (352, 139) and (477, 133).
; PLAN: r0=352(x1), r1=139(y1), r2=477(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 139
LDI r2, 477
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
