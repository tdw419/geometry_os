; DESCRIPTION: Places a blue line segment connecting (33, 13) to (286, 197).
; PLAN: r0=33(x1), r1=13(y1), r2=286(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 13
LDI r2, 286
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
