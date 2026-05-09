; DESCRIPTION: Draws a yellow line from (142, 138) to (45, 90).
; PLAN: r0=142(x1), r1=138(y1), r2=45(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 138
LDI r2, 45
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
