; DESCRIPTION: Draws a black line from (224, 136) to (134, 21).
; PLAN: r0=224(x1), r1=136(y1), r2=134(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 136
LDI r2, 134
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
