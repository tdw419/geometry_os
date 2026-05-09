; DESCRIPTION: Draws a black line from (293, 232) to (237, 39).
; PLAN: r0=293(x1), r1=232(y1), r2=237(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 232
LDI r2, 237
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
