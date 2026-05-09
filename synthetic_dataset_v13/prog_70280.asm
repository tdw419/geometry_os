; DESCRIPTION: Draws a black line from (318, 128) to (340, 12).
; PLAN: r0=318(x1), r1=128(y1), r2=340(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 128
LDI r2, 340
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
