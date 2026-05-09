; DESCRIPTION: Renders a blue line between points (61, 37) and (349, 53).
; PLAN: r0=61(x1), r1=37(y1), r2=349(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 37
LDI r2, 349
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
