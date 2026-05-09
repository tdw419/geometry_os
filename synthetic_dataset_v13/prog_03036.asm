; DESCRIPTION: Draws a black line from (185, 225) to (310, 21).
; PLAN: r0=185(x1), r1=225(y1), r2=310(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 225
LDI r2, 310
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
