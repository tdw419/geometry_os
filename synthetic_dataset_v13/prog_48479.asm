; DESCRIPTION: Places a blue line segment connecting (67, 24) to (434, 197).
; PLAN: r0=67(x1), r1=24(y1), r2=434(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 24
LDI r2, 434
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
