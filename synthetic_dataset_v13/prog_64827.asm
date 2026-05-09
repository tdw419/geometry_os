; DESCRIPTION: Draws a black line from (325, 171) to (55, 40).
; PLAN: r0=325(x1), r1=171(y1), r2=55(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 171
LDI r2, 55
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
