; DESCRIPTION: Renders a blue line between points (353, 197) and (363, 53).
; PLAN: r0=353(x1), r1=197(y1), r2=363(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 197
LDI r2, 363
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
