; DESCRIPTION: Draws a magenta line from (300, 230) to (457, 53).
; PLAN: r0=300(x1), r1=230(y1), r2=457(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 230
LDI r2, 457
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
