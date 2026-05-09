; DESCRIPTION: Draws a yellow line from (43, 149) to (70, 157).
; PLAN: r0=43(x1), r1=149(y1), r2=70(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 149
LDI r2, 70
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
