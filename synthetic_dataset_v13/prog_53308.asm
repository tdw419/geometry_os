; DESCRIPTION: Draws a black line from (368, 86) to (389, 200).
; PLAN: r0=368(x1), r1=86(y1), r2=389(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 86
LDI r2, 389
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
