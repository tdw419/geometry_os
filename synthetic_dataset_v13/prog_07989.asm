; DESCRIPTION: Draws a black line from (181, 72) to (12, 175).
; PLAN: r0=181(x1), r1=72(y1), r2=12(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 72
LDI r2, 12
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
