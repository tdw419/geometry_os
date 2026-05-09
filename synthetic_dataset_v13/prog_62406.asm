; DESCRIPTION: Renders a purple line between points (335, 231) and (339, 180).
; PLAN: r0=335(x1), r1=231(y1), r2=339(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 231
LDI r2, 339
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
