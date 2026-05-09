; DESCRIPTION: Draws a black line from (455, 63) to (472, 6).
; PLAN: r0=455(x1), r1=63(y1), r2=472(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 63
LDI r2, 472
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
