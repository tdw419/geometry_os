; DESCRIPTION: Draws a yellow line from (477, 149) to (20, 66).
; PLAN: r0=477(x1), r1=149(y1), r2=20(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 149
LDI r2, 20
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
