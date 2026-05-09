; DESCRIPTION: Draws a black line from (244, 237) to (363, 67).
; PLAN: r0=244(x1), r1=237(y1), r2=363(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 237
LDI r2, 363
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
