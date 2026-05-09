; DESCRIPTION: Places a black line segment connecting (49, 69) to (35, 142).
; PLAN: r0=49(x1), r1=69(y1), r2=35(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 69
LDI r2, 35
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
