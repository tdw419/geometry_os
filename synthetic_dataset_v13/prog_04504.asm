; DESCRIPTION: Draws a blue line from (304, 11) to (211, 55).
; PLAN: r0=304(x1), r1=11(y1), r2=211(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 11
LDI r2, 211
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
