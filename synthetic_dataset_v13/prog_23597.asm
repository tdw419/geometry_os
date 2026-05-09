; DESCRIPTION: Draws a black line from (280, 31) to (441, 136).
; PLAN: r0=280(x1), r1=31(y1), r2=441(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 31
LDI r2, 441
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
