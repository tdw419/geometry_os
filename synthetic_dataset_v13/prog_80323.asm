; DESCRIPTION: Draws a magenta line from (246, 41) to (188, 83).
; PLAN: r0=246(x1), r1=41(y1), r2=188(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 41
LDI r2, 188
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
