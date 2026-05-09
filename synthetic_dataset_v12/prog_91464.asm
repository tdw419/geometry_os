; DESCRIPTION: Places a blue line segment connecting (267, 141) to (327, 12).
; PLAN: r0=267(x1), r1=141(y1), r2=327(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 141
LDI r2, 327
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
