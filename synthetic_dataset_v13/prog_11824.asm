; DESCRIPTION: Draws a red line from (195, 132) to (43, 11).
; PLAN: r0=195(x1), r1=132(y1), r2=43(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 132
LDI r2, 43
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
