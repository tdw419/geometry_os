; DESCRIPTION: Places a blue line segment connecting (154, 134) to (349, 197).
; PLAN: r0=154(x1), r1=134(y1), r2=349(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 134
LDI r2, 349
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
