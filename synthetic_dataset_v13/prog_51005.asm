; DESCRIPTION: Draws a red line from (227, 149) to (127, 6).
; PLAN: r0=227(x1), r1=149(y1), r2=127(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 149
LDI r2, 127
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
