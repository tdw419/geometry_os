; DESCRIPTION: Renders a purple line between points (120, 102) and (305, 153).
; PLAN: r0=120(x1), r1=102(y1), r2=305(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 102
LDI r2, 305
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
