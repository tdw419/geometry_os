; DESCRIPTION: Draws a blue line from (185, 53) to (107, 28).
; PLAN: r0=185(x1), r1=53(y1), r2=107(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 53
LDI r2, 107
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
