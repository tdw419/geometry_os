; DESCRIPTION: Places a blue line segment connecting (380, 141) to (139, 106).
; PLAN: r0=380(x1), r1=141(y1), r2=139(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 141
LDI r2, 139
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
