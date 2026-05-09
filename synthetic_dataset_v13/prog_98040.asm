; DESCRIPTION: Draws a blue line from (74, 111) to (13, 93).
; PLAN: r0=74(x1), r1=111(y1), r2=13(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 111
LDI r2, 13
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
