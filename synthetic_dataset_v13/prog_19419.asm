; DESCRIPTION: Draws a black line from (147, 63) to (64, 84).
; PLAN: r0=147(x1), r1=63(y1), r2=64(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 63
LDI r2, 64
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
