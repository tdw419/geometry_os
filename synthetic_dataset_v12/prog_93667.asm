; DESCRIPTION: Draws a yellow line from (212, 179) to (135, 30).
; PLAN: r0=212(x1), r1=179(y1), r2=135(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 179
LDI r2, 135
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
