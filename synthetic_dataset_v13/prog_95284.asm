; DESCRIPTION: Draws a magenta line from (30, 212) to (217, 9).
; PLAN: r0=30(x1), r1=212(y1), r2=217(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 212
LDI r2, 217
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
