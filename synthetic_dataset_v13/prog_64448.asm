; DESCRIPTION: Draws a blue line from (267, 58) to (76, 34).
; PLAN: r0=267(x1), r1=58(y1), r2=76(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 58
LDI r2, 76
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
