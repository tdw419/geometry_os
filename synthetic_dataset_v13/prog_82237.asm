; DESCRIPTION: Draws a magenta line from (119, 30) to (74, 176).
; PLAN: r0=119(x1), r1=30(y1), r2=74(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 30
LDI r2, 74
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
