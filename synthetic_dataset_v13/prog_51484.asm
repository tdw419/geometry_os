; DESCRIPTION: Draws a black line from (113, 79) to (139, 106).
; PLAN: r0=113(x1), r1=79(y1), r2=139(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 79
LDI r2, 139
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
