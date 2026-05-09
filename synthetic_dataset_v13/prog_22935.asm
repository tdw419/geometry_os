; DESCRIPTION: Draws a black line from (454, 44) to (53, 34).
; PLAN: r0=454(x1), r1=44(y1), r2=53(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 44
LDI r2, 53
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
