; DESCRIPTION: Draws a magenta line from (361, 3) to (281, 85).
; PLAN: r0=361(x1), r1=3(y1), r2=281(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 3
LDI r2, 281
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
