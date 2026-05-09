; DESCRIPTION: Places a blue line segment connecting (76, 116) to (362, 127).
; PLAN: r0=76(x1), r1=116(y1), r2=362(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 116
LDI r2, 362
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
