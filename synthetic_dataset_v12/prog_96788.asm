; DESCRIPTION: Draws a blue line from (229, 202) to (53, 122).
; PLAN: r0=229(x1), r1=202(y1), r2=53(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 202
LDI r2, 53
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
