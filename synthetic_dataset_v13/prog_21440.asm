; DESCRIPTION: Draws a blue line from (462, 8) to (380, 149).
; PLAN: r0=462(x1), r1=8(y1), r2=380(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 8
LDI r2, 380
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
