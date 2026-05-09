; DESCRIPTION: Draws a red line from (97, 43) to (63, 45).
; PLAN: r0=97(x1), r1=43(y1), r2=63(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 43
LDI r2, 63
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
