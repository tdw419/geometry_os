; DESCRIPTION: Draws a yellow line from (79, 42) to (324, 97).
; PLAN: r0=79(x1), r1=42(y1), r2=324(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 42
LDI r2, 324
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
