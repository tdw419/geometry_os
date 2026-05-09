; DESCRIPTION: Renders a blue line between points (153, 39) and (124, 134).
; PLAN: r0=153(x1), r1=39(y1), r2=124(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 39
LDI r2, 124
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
