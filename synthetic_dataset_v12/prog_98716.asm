; DESCRIPTION: Draws a orange line from (189, 186) to (66, 68).
; PLAN: r0=189(x1), r1=186(y1), r2=66(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 186
LDI r2, 66
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
