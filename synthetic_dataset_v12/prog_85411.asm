; DESCRIPTION: Draws a black line from (160, 45) to (477, 103).
; PLAN: r0=160(x1), r1=45(y1), r2=477(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 45
LDI r2, 477
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
