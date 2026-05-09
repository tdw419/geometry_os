; DESCRIPTION: Draws a blue line from (467, 246) to (444, 138).
; PLAN: r0=467(x1), r1=246(y1), r2=444(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 246
LDI r2, 444
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
