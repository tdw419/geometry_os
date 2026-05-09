; DESCRIPTION: Draws a black line from (430, 220) to (321, 82).
; PLAN: r0=430(x1), r1=220(y1), r2=321(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 220
LDI r2, 321
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
