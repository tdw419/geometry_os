; DESCRIPTION: Draws a magenta line from (226, 207) to (361, 188).
; PLAN: r0=226(x1), r1=207(y1), r2=361(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 207
LDI r2, 361
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
