; DESCRIPTION: Draws a red line from (327, 188) to (309, 97).
; PLAN: r0=327(x1), r1=188(y1), r2=309(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 188
LDI r2, 309
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
