; DESCRIPTION: Draws a black line from (442, 183) to (211, 100).
; PLAN: r0=442(x1), r1=183(y1), r2=211(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 183
LDI r2, 211
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
