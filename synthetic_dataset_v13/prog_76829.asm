; DESCRIPTION: Draws a black line from (406, 73) to (441, 100).
; PLAN: r0=406(x1), r1=73(y1), r2=441(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 73
LDI r2, 441
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
