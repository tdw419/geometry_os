; DESCRIPTION: Draws a white line from (153, 138) to (506, 145).
; PLAN: r0=153(x1), r1=138(y1), r2=506(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 138
LDI r2, 506
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
