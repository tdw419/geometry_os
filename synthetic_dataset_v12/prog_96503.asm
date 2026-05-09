; DESCRIPTION: Draws a blue line from (90, 221) to (54, 189).
; PLAN: r0=90(x1), r1=221(y1), r2=54(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 221
LDI r2, 54
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
