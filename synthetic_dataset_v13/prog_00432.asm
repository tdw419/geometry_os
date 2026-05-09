; DESCRIPTION: Places a blue line segment connecting (466, 178) to (209, 53).
; PLAN: r0=466(x1), r1=178(y1), r2=209(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 178
LDI r2, 209
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
