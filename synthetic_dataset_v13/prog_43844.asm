; DESCRIPTION: Draws a blue line from (386, 246) to (19, 65).
; PLAN: r0=386(x1), r1=246(y1), r2=19(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 246
LDI r2, 19
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
