; DESCRIPTION: Places a blue line segment connecting (362, 48) to (29, 114).
; PLAN: r0=362(x1), r1=48(y1), r2=29(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 48
LDI r2, 29
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
