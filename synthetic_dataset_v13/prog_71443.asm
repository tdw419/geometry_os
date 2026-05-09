; DESCRIPTION: Places a blue line segment connecting (160, 166) to (21, 197).
; PLAN: r0=160(x1), r1=166(y1), r2=21(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 166
LDI r2, 21
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
