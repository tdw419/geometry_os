; DESCRIPTION: Draws a magenta line from (380, 85) to (139, 114).
; PLAN: r0=380(x1), r1=85(y1), r2=139(x2), r3=114(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 85
LDI r2, 139
LDI r3, 114
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
