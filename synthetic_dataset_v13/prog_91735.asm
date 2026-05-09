; DESCRIPTION: Draws a magenta line from (342, 105) to (127, 199).
; PLAN: r0=342(x1), r1=105(y1), r2=127(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 105
LDI r2, 127
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
