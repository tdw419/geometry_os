; DESCRIPTION: Renders a blue line between points (413, 86) and (116, 243).
; PLAN: r0=413(x1), r1=86(y1), r2=116(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 86
LDI r2, 116
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
