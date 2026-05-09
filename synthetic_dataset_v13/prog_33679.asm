; DESCRIPTION: Renders a blue line between points (238, 86) and (263, 68).
; PLAN: r0=238(x1), r1=86(y1), r2=263(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 86
LDI r2, 263
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
