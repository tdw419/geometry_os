; DESCRIPTION: Draws a black line from (6, 188) to (141, 24).
; PLAN: r0=6(x1), r1=188(y1), r2=141(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 188
LDI r2, 141
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
