; DESCRIPTION: Draws a black line from (64, 37) to (136, 172).
; PLAN: r0=64(x1), r1=37(y1), r2=136(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 37
LDI r2, 136
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
