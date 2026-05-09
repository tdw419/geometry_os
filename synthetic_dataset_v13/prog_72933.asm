; DESCRIPTION: Draws a blue line from (456, 140) to (405, 4).
; PLAN: r0=456(x1), r1=140(y1), r2=405(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 140
LDI r2, 405
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
