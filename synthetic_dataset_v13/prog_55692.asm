; DESCRIPTION: Draws a black line from (475, 2) to (248, 39).
; PLAN: r0=475(x1), r1=2(y1), r2=248(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 2
LDI r2, 248
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
