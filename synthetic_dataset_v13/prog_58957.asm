; DESCRIPTION: Draws a blue line from (220, 53) to (5, 233).
; PLAN: r0=220(x1), r1=53(y1), r2=5(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 53
LDI r2, 5
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
