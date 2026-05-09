; DESCRIPTION: Draws a black line from (185, 128) to (211, 56).
; PLAN: r0=185(x1), r1=128(y1), r2=211(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 128
LDI r2, 211
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
