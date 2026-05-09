; DESCRIPTION: Draws a black line from (326, 188) to (318, 144).
; PLAN: r0=326(x1), r1=188(y1), r2=318(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 188
LDI r2, 318
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
