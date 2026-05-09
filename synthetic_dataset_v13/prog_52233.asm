; DESCRIPTION: Draws a yellow line from (282, 194) to (456, 93).
; PLAN: r0=282(x1), r1=194(y1), r2=456(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 194
LDI r2, 456
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
