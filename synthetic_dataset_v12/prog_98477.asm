; DESCRIPTION: Renders a blue line between points (53, 197) and (297, 167).
; PLAN: r0=53(x1), r1=197(y1), r2=297(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 197
LDI r2, 297
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
