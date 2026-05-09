; DESCRIPTION: Draws a blue line from (31, 11) to (11, 124).
; PLAN: r0=31(x1), r1=11(y1), r2=11(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 11
LDI r2, 11
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
