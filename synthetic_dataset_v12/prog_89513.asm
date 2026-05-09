; DESCRIPTION: Draws a yellow line from (456, 112) to (483, 172).
; PLAN: r0=456(x1), r1=112(y1), r2=483(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 112
LDI r2, 483
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
