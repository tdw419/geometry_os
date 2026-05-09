; DESCRIPTION: Draws a black line from (505, 114) to (441, 44).
; PLAN: r0=505(x1), r1=114(y1), r2=441(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 114
LDI r2, 441
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
