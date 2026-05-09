; DESCRIPTION: Draws a purple line from (408, 149) to (462, 18).
; PLAN: r0=408(x1), r1=149(y1), r2=462(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 149
LDI r2, 462
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
