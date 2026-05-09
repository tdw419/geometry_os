; DESCRIPTION: Draws a black line from (69, 122) to (81, 48).
; PLAN: r0=69(x1), r1=122(y1), r2=81(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 122
LDI r2, 81
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
