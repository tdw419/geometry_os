; DESCRIPTION: Draws a magenta line from (113, 251) to (106, 86).
; PLAN: r0=113(x1), r1=251(y1), r2=106(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 251
LDI r2, 106
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
