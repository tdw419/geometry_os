; DESCRIPTION: Draws a blue line from (441, 243) to (274, 149).
; PLAN: r0=441(x1), r1=243(y1), r2=274(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 243
LDI r2, 274
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
