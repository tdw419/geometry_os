; DESCRIPTION: Draws a black line from (69, 69) to (3, 48).
; PLAN: r0=69(x1), r1=69(y1), r2=3(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 69
LDI r2, 3
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
