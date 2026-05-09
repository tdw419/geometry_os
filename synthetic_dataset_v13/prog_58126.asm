; DESCRIPTION: Places a blue line segment connecting (197, 207) to (464, 175).
; PLAN: r0=197(x1), r1=207(y1), r2=464(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 207
LDI r2, 464
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
