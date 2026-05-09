; DESCRIPTION: Renders a blue line between points (67, 225) and (363, 87).
; PLAN: r0=67(x1), r1=225(y1), r2=363(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 225
LDI r2, 363
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
