; DESCRIPTION: Draws a white line from (22, 172) to (156, 181).
; PLAN: r0=22(x1), r1=172(y1), r2=156(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 172
LDI r2, 156
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
