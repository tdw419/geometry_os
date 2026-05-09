; DESCRIPTION: Renders a blue line between points (361, 117) and (372, 151).
; PLAN: r0=361(x1), r1=117(y1), r2=372(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 117
LDI r2, 372
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
