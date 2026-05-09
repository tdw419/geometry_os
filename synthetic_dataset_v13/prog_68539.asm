; DESCRIPTION: Draws a magenta line from (311, 10) to (425, 26).
; PLAN: r0=311(x1), r1=10(y1), r2=425(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 10
LDI r2, 425
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
