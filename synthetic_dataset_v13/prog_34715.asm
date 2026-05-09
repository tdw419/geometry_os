; DESCRIPTION: Draws a yellow line from (448, 246) to (25, 236).
; PLAN: r0=448(x1), r1=246(y1), r2=25(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 246
LDI r2, 25
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
