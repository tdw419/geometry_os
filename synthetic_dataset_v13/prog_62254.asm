; DESCRIPTION: Places a blue line segment connecting (217, 3) to (57, 69).
; PLAN: r0=217(x1), r1=3(y1), r2=57(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 3
LDI r2, 57
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
