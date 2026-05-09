; DESCRIPTION: Draws a black line from (389, 67) to (272, 141).
; PLAN: r0=389(x1), r1=67(y1), r2=272(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 67
LDI r2, 272
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
