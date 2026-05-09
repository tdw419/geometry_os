; DESCRIPTION: Draws a blue line from (462, 38) to (246, 64).
; PLAN: r0=462(x1), r1=38(y1), r2=246(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 38
LDI r2, 246
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
