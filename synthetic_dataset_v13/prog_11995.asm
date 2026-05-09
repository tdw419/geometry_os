; DESCRIPTION: Draws a yellow line from (56, 69) to (55, 237).
; PLAN: r0=56(x1), r1=69(y1), r2=55(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 69
LDI r2, 55
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
