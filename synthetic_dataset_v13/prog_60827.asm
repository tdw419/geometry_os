; DESCRIPTION: Places a blue line segment connecting (457, 69) to (82, 134).
; PLAN: r0=457(x1), r1=69(y1), r2=82(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 69
LDI r2, 82
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
