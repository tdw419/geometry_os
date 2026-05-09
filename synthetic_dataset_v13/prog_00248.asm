; DESCRIPTION: Draws a blue line from (108, 5) to (30, 139).
; PLAN: r0=108(x1), r1=5(y1), r2=30(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 5
LDI r2, 30
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
