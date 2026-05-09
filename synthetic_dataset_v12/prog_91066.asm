; DESCRIPTION: Renders a blue line between points (398, 206) and (311, 101).
; PLAN: r0=398(x1), r1=206(y1), r2=311(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 206
LDI r2, 311
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
