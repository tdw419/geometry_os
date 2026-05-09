; DESCRIPTION: Draws a blue line from (458, 134) to (393, 226).
; PLAN: r0=458(x1), r1=134(y1), r2=393(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 134
LDI r2, 393
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
