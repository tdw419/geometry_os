; DESCRIPTION: Draws a blue line from (262, 207) to (246, 189).
; PLAN: r0=262(x1), r1=207(y1), r2=246(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 207
LDI r2, 246
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
