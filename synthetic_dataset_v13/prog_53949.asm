; DESCRIPTION: Draws a white line from (322, 45) to (81, 148).
; PLAN: r0=322(x1), r1=45(y1), r2=81(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 45
LDI r2, 81
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
