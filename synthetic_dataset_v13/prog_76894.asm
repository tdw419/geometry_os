; DESCRIPTION: Draws a black line from (457, 212) to (465, 149).
; PLAN: r0=457(x1), r1=212(y1), r2=465(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 212
LDI r2, 465
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
