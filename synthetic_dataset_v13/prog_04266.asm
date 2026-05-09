; DESCRIPTION: Draws a yellow line from (114, 140) to (142, 175).
; PLAN: r0=114(x1), r1=140(y1), r2=142(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 140
LDI r2, 142
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
