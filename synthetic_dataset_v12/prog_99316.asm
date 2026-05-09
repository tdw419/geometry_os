; DESCRIPTION: Draws a blue line from (6, 45) to (441, 187).
; PLAN: r0=6(x1), r1=45(y1), r2=441(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 45
LDI r2, 441
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
