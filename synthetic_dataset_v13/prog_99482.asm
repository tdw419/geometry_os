; DESCRIPTION: Places a blue line segment connecting (446, 244) to (197, 130).
; PLAN: r0=446(x1), r1=244(y1), r2=197(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 244
LDI r2, 197
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
