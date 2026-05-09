; DESCRIPTION: Draws a magenta line from (26, 106) to (50, 138).
; PLAN: r0=26(x1), r1=106(y1), r2=50(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 106
LDI r2, 50
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
