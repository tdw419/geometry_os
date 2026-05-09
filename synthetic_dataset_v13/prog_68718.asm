; DESCRIPTION: Draws a blue line from (309, 72) to (150, 129).
; PLAN: r0=309(x1), r1=72(y1), r2=150(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 72
LDI r2, 150
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
