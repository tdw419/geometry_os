; DESCRIPTION: Draws a blue line from (227, 73) to (111, 50).
; PLAN: r0=227(x1), r1=73(y1), r2=111(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 73
LDI r2, 111
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
