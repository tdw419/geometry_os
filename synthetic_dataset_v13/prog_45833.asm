; DESCRIPTION: Draws a black line from (81, 138) to (163, 107).
; PLAN: r0=81(x1), r1=138(y1), r2=163(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 138
LDI r2, 163
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
