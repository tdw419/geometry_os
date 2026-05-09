; DESCRIPTION: Renders a blue line between points (67, 138) and (407, 186).
; PLAN: r0=67(x1), r1=138(y1), r2=407(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 138
LDI r2, 407
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
