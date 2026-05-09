; DESCRIPTION: Places a blue line segment connecting (444, 197) to (310, 222).
; PLAN: r0=444(x1), r1=197(y1), r2=310(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 197
LDI r2, 310
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
