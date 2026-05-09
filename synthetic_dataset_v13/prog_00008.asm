; DESCRIPTION: Places a blue line segment connecting (160, 69) to (70, 6).
; PLAN: r0=160(x1), r1=69(y1), r2=70(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 69
LDI r2, 70
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
