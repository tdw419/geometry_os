; DESCRIPTION: Renders a blue line between points (226, 170) and (413, 134).
; PLAN: r0=226(x1), r1=170(y1), r2=413(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 170
LDI r2, 413
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
