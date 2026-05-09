; DESCRIPTION: Draws a blue line from (478, 154) to (45, 61).
; PLAN: r0=478(x1), r1=154(y1), r2=45(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 154
LDI r2, 45
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
