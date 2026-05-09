; DESCRIPTION: Draws a black line from (225, 76) to (459, 69).
; PLAN: r0=225(x1), r1=76(y1), r2=459(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 76
LDI r2, 459
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
