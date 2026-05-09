; DESCRIPTION: Draws a black line from (11, 44) to (345, 0).
; PLAN: r0=11(x1), r1=44(y1), r2=345(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 44
LDI r2, 345
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
