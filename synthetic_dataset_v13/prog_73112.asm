; DESCRIPTION: Draws a blue line from (251, 98) to (490, 83).
; PLAN: r0=251(x1), r1=98(y1), r2=490(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 98
LDI r2, 490
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
