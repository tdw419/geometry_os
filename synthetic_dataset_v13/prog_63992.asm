; DESCRIPTION: Renders a blue line between points (94, 146) and (282, 68).
; PLAN: r0=94(x1), r1=146(y1), r2=282(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 146
LDI r2, 282
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
