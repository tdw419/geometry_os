; DESCRIPTION: Renders a magenta line between points (339, 96) and (238, 194).
; PLAN: r0=339(x1), r1=96(y1), r2=238(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 96
LDI r2, 238
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
