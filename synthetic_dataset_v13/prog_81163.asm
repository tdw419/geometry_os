; DESCRIPTION: Draws a black line from (462, 192) to (86, 11).
; PLAN: r0=462(x1), r1=192(y1), r2=86(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 192
LDI r2, 86
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
