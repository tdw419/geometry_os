; DESCRIPTION: Renders a blue line between points (65, 197) and (477, 15).
; PLAN: r0=65(x1), r1=197(y1), r2=477(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 197
LDI r2, 477
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
