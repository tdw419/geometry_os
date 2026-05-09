; DESCRIPTION: Draws a blue line from (381, 28) to (94, 81).
; PLAN: r0=381(x1), r1=28(y1), r2=94(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 28
LDI r2, 94
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
