; DESCRIPTION: Draws a blue line from (380, 55) to (100, 8).
; PLAN: r0=380(x1), r1=55(y1), r2=100(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 55
LDI r2, 100
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
