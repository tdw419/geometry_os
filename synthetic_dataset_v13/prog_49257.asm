; DESCRIPTION: Renders a blue line between points (339, 126) and (301, 141).
; PLAN: r0=339(x1), r1=126(y1), r2=301(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 126
LDI r2, 301
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
