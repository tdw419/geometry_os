; DESCRIPTION: Draws a blue line from (5, 29) to (98, 176).
; PLAN: r0=5(x1), r1=29(y1), r2=98(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 29
LDI r2, 98
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
