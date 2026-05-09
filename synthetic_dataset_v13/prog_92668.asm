; DESCRIPTION: Places a black line segment connecting (306, 69) to (423, 239).
; PLAN: r0=306(x1), r1=69(y1), r2=423(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 69
LDI r2, 423
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
