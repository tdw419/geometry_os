; DESCRIPTION: Draws a black line from (63, 177) to (482, 155).
; PLAN: r0=63(x1), r1=177(y1), r2=482(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 177
LDI r2, 482
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
