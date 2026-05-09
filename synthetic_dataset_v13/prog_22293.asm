; DESCRIPTION: Draws a red line from (39, 101) to (13, 63).
; PLAN: r0=39(x1), r1=101(y1), r2=13(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 101
LDI r2, 13
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
