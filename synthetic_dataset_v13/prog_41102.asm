; DESCRIPTION: Draws a yellow line from (0, 44) to (343, 90).
; PLAN: r0=0(x1), r1=44(y1), r2=343(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 44
LDI r2, 343
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
