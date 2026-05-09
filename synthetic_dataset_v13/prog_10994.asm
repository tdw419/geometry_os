; DESCRIPTION: Draws a blue line from (458, 253) to (55, 150).
; PLAN: r0=458(x1), r1=253(y1), r2=55(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 253
LDI r2, 55
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
