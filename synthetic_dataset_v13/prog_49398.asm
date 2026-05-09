; DESCRIPTION: Places a blue line segment connecting (196, 150) to (202, 53).
; PLAN: r0=196(x1), r1=150(y1), r2=202(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 150
LDI r2, 202
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
