; DESCRIPTION: Renders a blue line between points (204, 190) and (383, 207).
; PLAN: r0=204(x1), r1=190(y1), r2=383(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 190
LDI r2, 383
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
